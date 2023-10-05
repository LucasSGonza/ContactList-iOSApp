//
//  EditContactViewController.swift
//  AppListaContatos
//
//  Created by Squad Apps on 27/07/23.
//

//LINKS ABAIXO SERÃO RETIRADOS DAQUI

//ScrollView: https://www.youtube.com/watch?v=orONrVT6CAg
/*
 UI/UX:
 
- https://fonts.google.com/icons
- https://developer.apple.com/design/human-interface-guidelines/text-fields
- https://m2.material.io/components/text-fields/ios
 
 */

import UIKit

class EditContactViewController: HelpController {
    
    private var favoriteChanged:Bool = false
    private var isFavorite:Bool = false
    private var isNameValid:Bool = true
    private var isLastNameValid:Bool = true
    private var isPhoneValid:Bool = true
    
    @IBOutlet weak var favoriteImageView: UIImageView!
    @IBOutlet weak var trashImageView: UIImageView!
    @IBOutlet weak var phoneImageView: UIImageView!
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var nameIconImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var lastNameIconImageView: UIImageView!
    @IBOutlet weak var lastNameLabel: UILabel!
    
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var phoneIconImageView: UIImageView!
    @IBOutlet weak var phoneLabel: UILabel!
    
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
        setupFavoriteIcon()
        self.navigationItem.rightBarButtonItem?.isEnabled = false
        
        print(contact.showInfos())
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.aceptChanges = false
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
    
    //MARK: setupFavoriteIcon
    private func setupFavoriteIcon() {
        if contact.getIsFavorite() {
            isFavorite = true
            favoriteImageView.image = UIImage(systemName: "star.fill")
        } else {
            isFavorite = false
            favoriteImageView.image = UIImage(systemName: "star")
        }
    }
    
    //MARK: setup TextFields
    private func setupTextFields() {
        self.setupTextFieldsVisual(nameTextField: self.nameTextField, lastNameTextField: self.lastNameTextField, phoneTextField: self.phoneTextField)
        
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
    
    //MARK:Hide or not save btt
    private func canSave() {
        self.navigationItem.rightBarButtonItem?.isEnabled = (isNameValid && isLastNameValid && isPhoneValid)
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
    
    //MARK: Favorite contact
    @objc private func favoriteContact() {
        if isFavorite {//contact is favorite? when click will become not favorite
            isFavorite = false
            favoriteImageView.image = UIImage(systemName: "star")
        } else {
            isFavorite = true
            favoriteImageView.image = UIImage(systemName: "star.fill")
        }
        favoriteChanged = true
        canSave()
    }
    
    //MARK: confirmEdition
    @objc private func confirmEdition() {
        print(contact.showInfos())
        
        guard let name = nameTextField.text, let lastName = lastNameTextField.text, let phone = phoneTextField.text else { return }
        
        isFavorite ? contact.setFavorite(true) : contact.setFavorite(false)
        
        contact.setName(name)
        contact.setLastName(lastName)
        contact.setPhone(phone)
        print("---------\n \(contact.showInfos())")
        self.aceptChanges = true
        setupAlert(title: "Success", message: "Contact updated!", completion: { self.goBack() })
    }
    
    //MARK: Delete contact
    @objc private func deleteContact() {
        //guard let contact = contact else { return }
        contactList.removeAll(where: {$0.getID() == contact.getID()})
        self.aceptChanges = true
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
        } else {
            validTextField(textField: nameTextField, icon: nameIconImageView)
            nameLabel.isHidden = true
            isNameValid = true
        }
        
        canSave() //verifica como ficará o estado do botao, apos toda a validação
    }
    
    //MARK: Validate Last Name !
    @objc func validateLastName() {
        guard let lastNameText = lastNameTextField.text else { return }
        
        if lastNameText.isEmpty {
            errorTextField(textField: lastNameTextField, icon: lastNameIconImageView)
            lastNameLabel.isHidden = false
            lastNameLabel.text = "Field cannot be empty"
            isLastNameValid = false
        } else {
            validTextField(textField: lastNameTextField, icon: lastNameIconImageView)
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
            phoneLabel.text = "Please provide a valid phone number"
            isPhoneValid = false
        } else {
            validTextField(textField: phoneTextField, icon: phoneIconImageView)
            phoneLabel.isHidden = true
            isPhoneValid = true
        }
        
        canSave()
    }
    
}
