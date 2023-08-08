//
//  NewContactViewController.swift
//  AppListaContatos
//
//  Created by Squad Apps on 20/07/23.
//

import UIKit

class NewContactViewController: HelpController {
    
    private var contactList:[Contact] = []
    private var firstScreen:ContactListDelegate?
    
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
    
    //MARK:TextFields
    private func clearTextFields() {
        nameTextField.text = ""
        lastNameTextField.text = ""
        phoneTextField.text = ""
    }
    
    private func setupTextFields() {
        nameTextField.attributedPlaceholder = NSAttributedString(
                    string: "Name",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "placeholderColor")]
                )
        lastNameTextField.attributedPlaceholder = NSAttributedString(
                    string: "Last Name",
                    attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "placeholderColor")]
                )
        phoneTextField.attributedPlaceholder = NSAttributedString(
                    string: "Phone",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "placeholderColor")]
                )
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
    
    //MARK: objc funcs
    @objc private func goBack() {
        guard let firstScreen = firstScreen else { return }
        firstScreen.setContactList(contactList)
        navigationController?.popViewController(animated: true)
        //self.dismiss(animated: true, completion: nil)
    }

    @objc private func newContact() {
        guard let firstName = nameTextField.text, let lastName = lastNameTextField.text, let phone = phoneTextField.text else { return }
        
        let contact = Contact()
        
        if !firstName.isEmpty || !lastName.isEmpty {
            contact.setName(firstName)
            contact.setLastName(lastName)
            
            if !phone.isEmpty {
                contact.setPhone(phone)
            }
            
            contact.setID(contactList.count)
            print(contact.showInfos())
            contactList.append(contact)
            setupAlert(title: "Sucess", message: "Contact created with success!")
            clearTextFields()
        } else {
            setupAlert(title: "Error", message: "To create a contact, at least inform a 'Name' or a 'Last Name'")
        }
    }
    
    func initView(_ contactList:[Contact], firstScreen:ContactListDelegate) {
        self.firstScreen = firstScreen
        self.contactList = contactList
    }
    
}
