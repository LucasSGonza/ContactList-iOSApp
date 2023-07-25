//
//  NewContactViewController.swift
//  AppListaContatos
//
//  Created by Squad Apps on 20/07/23.
//

import UIKit

class NewContactViewController: HelpController {
    
    private var contactList:[Contact] = []
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        // Do any additional setup after loading the view.
    }
    
    //MARK: setup NavBar
    private func setupNavigationBar(){
        
        navigationItem.title = "New Contact"
        
        //buttons for navbar
        let cancelButton = UIBarButtonItem(
            barButtonSystemItem: .cancel,
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
    
//    private func setupButtons() {
//        deleteButton.layer.cornerRadius = 10
//    }
    
    //MARK: buttons objc funcs
    @objc private func goBack() {
        navigationController?.popViewController(animated: true)
        //self.dismiss(animated: true, completion: nil)
    }

    @objc private func newContact() {
        guard let firstName = nameTextField.text, let lastName = lastNameTextField.text, let phone = phoneTextField.text else {return }
        
        let contact = Contact()
        
        if !firstName.isEmpty || !lastName.isEmpty {
            contact.setName(firstName)
            contact.setLastName(lastName)
            
            if !phone.isEmpty {
                contact.setPhone(phone)
            }
            
            print(contact.showInfos())
            contactList.append(contact)
            setupAlert(title: "Sucess", message: "Contact created with success!")
        } else {
            setupAlert(title: "Error", message: "To create a contact, at least inform a 'Name' or a 'Last Name'")
        }
    }
    
}
