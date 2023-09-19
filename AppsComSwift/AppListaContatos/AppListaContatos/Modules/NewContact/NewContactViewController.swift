//
//  NewContactViewController.swift
//  AppListaContatos
//
//  Created by Squad Apps on 20/07/23.
//

import UIKit

class NewContactViewController: HelpController {
    
    private var contactList:[Contact] = []
    private weak var delegate:ContactListDelegate?
    
//    private var flagInputs:[Bool] = []
    private var areInputsValid:Bool = false
    
    @IBOutlet weak var nameIconImageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var lastNameIconImageView: UIImageView!
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var phoneIconImageView: UIImageView!
    @IBOutlet weak var phoneTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupTextFields(nameTextField: self.nameTextField, lastNameTextField: self.lastNameTextField, phoneTextField: self.phoneTextField)
        setupTextFieldsDelegate()
    }
    
    //MARK:InitView
    func initView(_ contactList:[Contact], delegate:ContactListDelegate) {
        self.delegate = delegate
        self.contactList = contactList
    }
    
    //MARK: SetupTextField Delegate
    private func setupTextFieldsDelegate(){
        self.nameTextField.delegate = self
        self.lastNameTextField.delegate = self
        self.phoneTextField.delegate = self
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
    
    //MARK:Clear TextFields
    private func clearTextFields() {
        nameTextField.text = ""
        lastNameTextField.text = ""
        phoneTextField.text = ""
    }
    
    //MARK:Go back
    @objc private func goBack() {
        delegate?.setContactList(contactList)
        self.navigationController?.popViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
    }
    
    //MARK: NewContact
    @objc private func newContact() {
        guard let name = nameTextField.text, let lastName = lastNameTextField.text, let phone = phoneTextField.text else { return }

        let contact = Contact() //cria um contato vazio e o preenche se houverem campos com informações
        
        if verifyIfInputsAreEmpty(name: name, lastName: lastName, phone: phone) {
            contact.setName(name)
            contact.setLastName(lastName)
            contact.setPhone(phone)
            contact.setID(contactList.count) //praticamente realiza um contactList.count - 1 pois eu defino o ID antes de adicionar o contato na Array, portanto pega o estado dela antes desse novo contato
            contactList.append(contact)
            setupAlert(title: "Sucess", message: "Contact created with success!")
            clearTextFields()
        } else {
            setupAlert(title: "ERROR", message: "Data should not be empty!")
        }
    }
    
}

extension NewContactViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.systemGreen.cgColor
        
        switch true {
        case textField.placeholder == "Name":
            nameIconImageView.tintColor = UIColor(named: "adaptGreenColor")
            break
            
        case textField.placeholder == "Last Name":
            lastNameIconImageView.tintColor = UIColor(named: "adaptGreenColor")
            break
            
        case textField.placeholder == "Phone":
            phoneIconImageView.tintColor = UIColor(named: "adaptGreenColor")
            break
            
        default:
            break
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if validateInputs(textField: textField) {
            textField.layer.borderColor = UIColor(named: "textFieldColor")?.cgColor ?? UIColor.systemGray.cgColor
            areInputsValid = true
        } else {
            textField.layer.borderColor = UIColor.systemRed.cgColor
            areInputsValid = false
        }
        
//        flagInputs.append(areInputsValid)
        
        switch true {
        case textField.placeholder == "Name":
            nameIconImageView.tintColor = validateInputs(textField: textField) ? UIColor(named: "adaptGreenColor") : UIColor.systemRed
            break
            
        case textField.placeholder == "Last Name":
            lastNameIconImageView.tintColor = validateInputs(textField: textField) ? UIColor(named: "adaptGreenColor") : UIColor.systemRed
            break
            
        case textField.placeholder == "Phone":
            phoneIconImageView.tintColor = validateInputs(textField: textField) ? UIColor(named: "adaptGreenColor") : UIColor.systemRed
            break
            
        default:
            break
        }
        
//        print(flagInputs)
        
        if areInputsValid {
            self.navigationItem.rightBarButtonItem?.isEnabled = true
        } else {
            self.navigationItem.rightBarButtonItem?.isEnabled = false
        }
        
    }
    
}
