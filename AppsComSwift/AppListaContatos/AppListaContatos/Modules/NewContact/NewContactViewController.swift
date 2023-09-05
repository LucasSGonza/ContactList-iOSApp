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
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupTextFields()
        // Do any additional setup after loading the view.
    }
    
    //MARK:InitView
    func initView(_ contactList:[Contact], delegate:ContactListDelegate) {
        self.delegate = delegate
        self.contactList = contactList
    }
    
    private func setupTextFields() {
        nameTextField.attributedPlaceholder = NSAttributedString(
                    string: "Name",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGray]
                )
        nameTextField.layer.borderColor = UIColor(named: "textFieldColor")?.cgColor ?? UIColor.systemGray.cgColor
        nameTextField.layer.borderWidth = 1.0
        nameTextField.layer.cornerRadius = 10
        nameTextField.layer.masksToBounds = true
        
        lastNameTextField.attributedPlaceholder = NSAttributedString(
                    string: "Last Name",
                    attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGray]
                )
        lastNameTextField.layer.borderColor = UIColor(named: "textFieldColor")?.cgColor ?? UIColor.systemGray.cgColor
        lastNameTextField.layer.borderWidth = 1.0
        lastNameTextField.layer.cornerRadius = 10
        lastNameTextField.layer.masksToBounds = true
        
        phoneTextField.attributedPlaceholder = NSAttributedString(
                    string: "Phone",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGray]
                )
        phoneTextField.layer.borderColor = UIColor(named: "textFieldColor")?.cgColor ?? UIColor.systemGray.cgColor
        phoneTextField.layer.borderWidth = 1.0
        phoneTextField.layer.cornerRadius = 10
        phoneTextField.layer.masksToBounds = true
    }
    
    //MARK:TextFields
    private func clearTextFields() {
        nameTextField.text = ""
        lastNameTextField.text = ""
        phoneTextField.text = ""
    }
    
//    private func didSelectedTextField() {
//        nameTextField.delegate?.textFieldDidBeginEditing?(nameTextField)
//        nameTextField.layer.borderColor = UIColor(named: "adaptGreenColor")?.cgColor
//        nameTextField.delegate?.textFieldDidEndEditing?(nameTextField)
//    }
    
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

        
        let addContact = UIBarButtonItem(
            barButtonSystemItem: .done,
            target: self,
            action: #selector(newContact))
        addContact.tintColor = UIColor(named: "buttonsTabBar")
        addContact.setTitleTextAttributes(
            [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 20.0)],
            for: .normal)
        
        self.navigationItem.leftBarButtonItem = cancelButton
        self.navigationItem.rightBarButtonItem = addContact
    }
    
    //MARK:Go back
    @objc private func goBack() {
        delegate?.setContactList(contactList)
        self.navigationController?.popViewController(animated: true)
        //self.dismiss(animated: true, completion: nil)
    }
    
    //MARK: NewContact
    @objc private func newContact() {
        guard let firstName = nameTextField.text, let lastName = lastNameTextField.text, let phone = phoneTextField.text else { return }
        
        let contact = Contact() //cria um contato vazio e o preenche se houverem campos com informações
        
        if !firstName.isEmpty || !lastName.isEmpty {
            contact.setName(firstName)
            contact.setLastName(lastName)
            
            if !phone.isEmpty {
                contact.setPhone(phone)
            }
            
            contact.setID(contactList.count) //define um ID para o contato, baseado no tamanho atual da Array
            print(contact.showInfos())
            contactList.append(contact)
            setupAlert(title: "Sucess", message: "Contact created with success!")
            clearTextFields()
        } else {
            setupAlert(title: "Error", message: "To create a contact, at least inform a 'Name' or a 'Last Name'")
        }
    }
    
}
