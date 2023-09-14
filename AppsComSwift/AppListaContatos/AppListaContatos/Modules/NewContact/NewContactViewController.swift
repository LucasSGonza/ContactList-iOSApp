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
        setupTextFields(nameTextField: self.nameTextField, lastNameTextField: self.lastNameTextField, phoneTextField: self.phoneTextField)
        // Do any additional setup after loading the view.
    }
    
    //MARK:InitView
    func initView(_ contactList:[Contact], delegate:ContactListDelegate) {
        self.delegate = delegate
        self.contactList = contactList
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
        self.dismiss(animated: true, completion: nil)
    }
    
    //MARK: NewContact
    @objc private func newContact() {
        guard let name = nameTextField.text, let lastName = lastNameTextField.text, let phone = phoneTextField.text else { return }

        let contact = Contact() //cria um contato vazio e o preenche se houverem campos com informações
        
        if validateInputs(name: name, lastName: lastName, phone: phone) {
            contact.setName(name)
            contact.setLastName(lastName)
            contact.setPhone(phone)
            contact.setID(contactList.count) //praticamente realiza um contactList.count - 1 pois eu defino o ID antes de adicionar o contato na Array, portanto pega o estado dela antes desse novo contato
            contactList.append(contact)
            setupAlert(title: "Sucess", message: "Contact created with success!")
            clearTextFields()
        } else {
            setupAlert(title: "ERROR", message: "Verify the data and try again!")
        }
        
    }
    
}
