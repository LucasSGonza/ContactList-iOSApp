//
//  NewContactViewController.swift
//  AppListaContatos
//
//  Created by Squad Apps on 20/07/23.
//

import UIKit

class NewContactViewController: HelpController {
    
    @IBOutlet weak var testeInput: FloatingLabelInput!
    
    private var contactList:[Contact] = []
    private weak var delegate:ContactListDelegate?
    
    private var isNameValid:Bool = false
    private var isLastNameValid:Bool = false
    private var isPhoneValid:Bool = false
    
    @IBOutlet weak var nameIconImageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var lastNameIconImageView: UIImageView!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var lastNameLabel: UILabel!
    
    @IBOutlet weak var phoneIconImageView: UIImageView!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var phoneLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupTextFieldsVisual(nameTextField: self.nameTextField, lastNameTextField: self.lastNameTextField, phoneTextField: self.phoneTextField)
        setupValidation()
        setupTextFieldsDelegate()
    }
    
    //MARK:InitView
    func initView(_ contactList:[Contact], delegate:ContactListDelegate) {
        self.delegate = delegate
        self.contactList = contactList
    }
    
    //MARK:Hide or not save btt
    private func canSave() {
        self.navigationItem.rightBarButtonItem?.isEnabled = (isNameValid && isLastNameValid && isPhoneValid)
    }

    //MARK: setup NavBar
    private func setupNavigationBar() {
        
        navigationItem.title = "New Contact"
        
        //buttons for navbar
        let cancelButton = UIBarButtonItem(
            barButtonSystemItem: .close,
            target: self,
            action: #selector(goBack))
        cancelButton.tintColor = UIColor(named: "buttonsTabBar")
        cancelButton.setTitleTextAttributes(
            [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 20.0)],
            for: .normal)

        let addContactButton = UIBarButtonItem(
            barButtonSystemItem: .done,
            target: self,
            action: #selector(newContact))
        addContactButton.tintColor = UIColor(named: "buttonsTabBar")
        addContactButton.setTitleTextAttributes(
            [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 20.0)],
            for: .normal)
        addContactButton.isEnabled = false
        
        self.navigationItem.leftBarButtonItem = cancelButton
        self.navigationItem.rightBarButtonItem = addContactButton
    }
    
    //MARK:Go back
    @objc private func goBack() {
        delegate?.setContactList(contactList)
        self.navigationController?.popViewController(animated: true)
    }
    
    //MARK: NewContact
    @objc private func newContact() {
        guard let name = nameTextField.text, let lastName = lastNameTextField.text, let phone = phoneTextField.text else { return }

        let contact = Contact() //cria um contato vazio e o preenche se houverem campos com informações
        
        contact.setName(name)
        contact.setLastName(lastName)
        contact.setPhone(phone)
        contact.setID(contactList.count) //praticamente realiza um contactList.count - 1 pois eu defino o ID antes de adicionar o contato na Array, portanto pega o estado dela antes desse novo contato
        contactList.append(contact)
        setupAlert(title: "Sucess", message: "Contact created with success!", completion: goBack)
    }
    
}

//MARK: UITextFieldDelegate
extension NewContactViewController: UITextFieldDelegate {
    
    func setupTextFieldsDelegate() {
        nameTextField.delegate = self
        lastNameTextField.delegate = self
        phoneTextField.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        textField.resignFirstResponder()
        return true
    }
    
    //https://www.hackingwithswift.com/example-code/uikit/how-to-limit-the-number-of-characters-in-a-uitextfield-or-uitextview#:~:text=If%20you%20have%20a%20UITextField,shouldChangeTextIn%20(for%20text%20views).
    //limit the characters in the textFields -> basicamente irá 'ficar trocando' sempre o textField pra quando chegar no limite estabelecido, poder ainda conseguir fazer alterações
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // get the current text, or use an empty string if that failed
        let currentText = textField.text ?? ""

        // attempt to read the range they are trying to change, or exit if we can't
        guard let stringRange = Range(range, in: currentText) else { return false }
        
        // add their new text to the existing text
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)

        // make sure the result is under x characters
        return updatedText.count <= 20
    }
    
}

//MARK:Validation textFields
extension NewContactViewController {
    
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
        canSave()
    }
    
    //MARK: Validate Last Name !
    //turn this opcional
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
