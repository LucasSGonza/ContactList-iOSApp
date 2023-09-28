//
//  EditContactViewController.swift
//  AppListaContatos
//
//  Created by Squad Apps on 27/07/23.
//

import UIKit

class EditContactViewController: HelpController {
    
    private var isNameValid:Bool = false
    private var isLastNameValid:Bool = false
    private var isPhoneValid:Bool = false
    
    @IBOutlet weak var nameIconImageView: UIImageView!
    @IBOutlet weak var lastNameIconImageView: UIImageView!
    @IBOutlet weak var phoneIconImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var favoriteImageView: UIImageView!
    @IBOutlet weak var trashImageView: UIImageView!
    @IBOutlet weak var phoneImageView: UIImageView!
    
    //MARK:Pass & Receive Data
    private var contactList:[Contact] = []
    private var delegate:ContactListDelegate?
    private var contact:Contact = Contact()
    private var aceptChanges:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextFields()
        setupNavigationBar()
        setupIconActions()
        setupValidation()
        setupTextFieldsDelegate()
        
        print(contact.showInfos())
        favoriteImageView.image = contact.isFavorite ? UIImage(systemName: "star.fill") : UIImage(systemName: "star")
    }
    
    //MARK: InitView
    func initView(contact:Contact, contactList:[Contact], delegate:ContactListDelegate) {
        self.contact = contact
        self.contactList = contactList
        self.delegate = delegate
    }
    
    //MARK: setup Icon actions
    private func setupIconActions() {
        
        let tapFavorite = UITapGestureRecognizer(target: self, action: #selector(favoriteContact))
        favoriteImageView.addGestureRecognizer(tapFavorite)
        
        let tapTrash = UITapGestureRecognizer(target: self, action: #selector(deleteContact))
        trashImageView.addGestureRecognizer(tapTrash)
        
//        let tapCall = UITapGestureRecognizer(target: self, action: #selector(callContact))
//        phoneImageView.addGestureRecognizer(tapCall)
    }
    
    //MARK:Hide or not save btt
    private func canSave() {
        self.navigationItem.rightBarButtonItem?.isEnabled = (isNameValid && isLastNameValid && isPhoneValid)
    }
    
    //MARK: setup TextFields
    private func setupTextFields() {
        self.setupTextFields(nameTextField: self.nameTextField, lastNameTextField: self.lastNameTextField, phoneTextField: self.phoneTextField)
        self.nameTextField.text = contact.getName()
        self.lastNameTextField.text = contact.getLastName()
        self.phoneTextField.text = contact.getPhone()
    }
    
    //MARK: setup NavBar
    private func setupNavigationBar() {
        
        navigationItem.title = "Edit Contact"
        
        //buttons for navbar
        let cancelButton = UIBarButtonItem(
            barButtonSystemItem: .close,
            target: self,
            action: #selector(goBack))
        cancelButton.tintColor = UIColor(named: "buttonsTabBar")
        cancelButton.setTitleTextAttributes(
            [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 20.0)],
            for: .normal)
        
        let confirmEditionButton = UIBarButtonItem(
            barButtonSystemItem: .done,
            target: self,
            action: #selector(confirmEdition))
        confirmEditionButton.tintColor = UIColor(named: "buttonsTabBar")
        confirmEditionButton.isEnabled = true
        confirmEditionButton.setTitleTextAttributes(
            [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 20.0)],
            for: .normal)
        
        self.navigationItem.leftBarButtonItem = cancelButton
        self.navigationItem.rightBarButtonItem = confirmEditionButton
    }

    //MARK: goBack
    @objc private func goBack() {
        if aceptChanges {
            guard let delegate = delegate else { return }
            delegate.setContactList(contactList)
            self.navigationController?.popViewController(animated: true)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    //MARK: confirmEdition
    @objc private func confirmEdition() {
        print(contact.showInfos())
        
        guard let name = nameTextField.text, let lastName = lastNameTextField.text, let phone = phoneTextField.text else { return }
        
        contact.setName(name)
        contact.setLastName(lastName)
        contact.setPhone(phone)
        print("---------\n \(contact.showInfos())")
        self.aceptChanges = true
        setupAlert(title: "Success", message: "Contact updated!", completion: { self.goBack() })
    }
    
    //MARK: Favorite contact
    @objc private func favoriteContact() {
        //guard let contact = contact else {return }
        
        if contact.isFavorite {//contact is favorite? when click will become not favorite
            contact.isFavorite = false
            favoriteImageView.image = UIImage(systemName: "star")
        } else {
            contact.isFavorite = true
            favoriteImageView.image = UIImage(systemName: "star.fill")
        }
        print(contact.isFavorite)
    }
    
    //MARK: Delete contact
    @objc private func deleteContact() {
        //guard let contact = contact else { return }
        contactList.removeAll(where: {$0.getID() == contact.getID()})
        aceptChanges = true
        setupAlert(title: "Sucess!", message: "Contact deleted with success", completion: { self.goBack() })
    }

}

//MARK: UITextFieldDelegate
extension EditContactViewController: UITextFieldDelegate {
    
    func setupTextFieldsDelegate() {
        nameTextField.delegate = self
        lastNameTextField.delegate = self
        phoneTextField.delegate = self
    }
    
    //https://www.hackingwithswift.com/example-code/uikit/how-to-limit-the-number-of-characters-in-a-uitextfield-or-uitextview#:~:text=If%20you%20have%20a%20UITextField,shouldChangeTextIn%20(for%20text%20views).
    //limit the characters in the textFields
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // get the current text, or use an empty string if that failed
        let currentText = textField.text ?? ""

        // attempt to read the range they are trying to change, or exit if we can't
        guard let stringRange = Range(range, in: currentText) else { return false }

        // add their new text to the existing text
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)

        // make sure the result is under 16 characters
        return updatedText.count <= 20
    }
    
}


//MARK: Validation TextFields
extension EditContactViewController {
    
    private func setupValidation() {
        nameTextField.addTarget(self, action: #selector(validateName), for: .editingChanged)
        lastNameTextField.addTarget(self, action: #selector(validateLastName), for: .editingChanged)
        phoneTextField.addTarget(self, action: #selector(validatePhone), for: .editingChanged)
    }
    
    //MARK: Validate Name
    @objc func validateName() {
        guard let nameText = nameTextField.text else { return }
        
        if nameText.isEmpty {
            errorTextField(textField: nameTextField, icon: nameIconImageView)
            nameLabel.isHidden = false
            nameLabel.text = "Field cannot be empty"
            isNameValid = false
//        } else if !nameText.isNameValid() {
//            errorTextField(textField: nameTextField, icon: nameIconImageView)
//            nameLabel.isHidden = false
//            nameLabel.text = "First name must only contain letters and no unnecessary empty spaces"
//            isNameValid = false
//        } else {
            normalTextField(textField: nameTextField, icon: nameIconImageView)
            nameLabel.isHidden = true
            isNameValid = true
        }
        canSave()
    }
    
    //MARK: Validate Last Name !
    @objc func validateLastName() {
        guard let lastNameText = lastNameTextField.text else { return }
        
        if lastNameText.isEmpty {
            errorTextField(textField: lastNameTextField, icon: lastNameIconImageView)
            lastNameLabel.isHidden = false
            lastNameLabel.text = "Field cannot be empty"
            isLastNameValid = false
//        } else if !lastNameText.isNameValid() {
//            errorTextField(textField: lastNameTextField, icon: lastNameIconImageView)
//            lastNameLabel.isHidden = false
//            lastNameLabel.text = "Last name must only contain letters and no unnecessary empty spaces"
//            isLastNameValid = false
        } else {
            normalTextField(textField: lastNameTextField, icon: lastNameIconImageView)
            lastNameLabel.isHidden = true
            isLastNameValid = true
        }
        canSave()

    }
    
    //MARK: Validate Phone
    @objc func validatePhone() {
        guard let phoneText = phoneTextField.text else { return }
        
        if phoneText.isEmpty {
            errorTextField(textField: phoneTextField, icon: phoneIconImageView)
            phoneLabel.isHidden = false
            phoneLabel.text = "Field cannot be empty"
            isPhoneValid = false
        } else if !phoneText.isPhoneValid() {
            errorTextField(textField: phoneTextField, icon: phoneIconImageView)
            phoneLabel.isHidden = false
            phoneLabel.text = "Phone must only contain numbers"
            isPhoneValid = false
        } else {
            normalTextField(textField: phoneTextField, icon: phoneIconImageView)
            phoneLabel.isHidden = true
            isPhoneValid = true
        }
        canSave()
    }
    
}
