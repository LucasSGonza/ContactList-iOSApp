//
//  EditContactViewController.swift
//  AppListaContatos
//
//  Created by Squad Apps on 27/07/23.
//

import UIKit

class EditContactViewController: HelpController {
    
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var favoriteImageView: UIImageView!
    
    //MARK:Pass & Receive Data
    private var contactList:[Contact] = []
    private var firstScreen:ContactListDelegate?
    private var contactID:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(contactList.first?.showInfos() ?? "nada")
        setupTextFields()
        setupNavigationBar()
        let tap = UITapGestureRecognizer(target: self, action: #selector(favoriteSelected))
        favoriteImageView.addGestureRecognizer(tap)
    }
    
    
    //MARK: InitView
    func initView(contactList:[Contact], firstScreen:ContactListDelegate, contactID:Int) {
        self.firstScreen = firstScreen
        self.contactList = contactList
        self.contactID = contactID
    }
    
    //MARK: TextFields
    private func setupTextFields() {
        //procura Array pelo id
        guard let contact = contactList.first(where: {$0.getID() == contactID}) else { return }
        self.nameTextField.text = contact.getName()
        self.lastNameTextField.text = contact.getLastName()
        self.phoneTextField.text = contact.getPhone()
    }
    
    //MARK: Nav Bar
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
        
        let doneButton = UIBarButtonItem(
            barButtonSystemItem: .done,
            target: self,
            action: #selector(editContact))
        doneButton.tintColor = UIColor(named: "buttonsTabBar")
        doneButton.setTitleTextAttributes(
            [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 20.0)],
            for: .normal)
        
        self.navigationItem.leftBarButtonItem = cancelButton
        self.navigationItem.rightBarButtonItem = doneButton
    }
    
//        let tap = UITapGestureRecognizer(target: self, action: #selector(favoriteSelected))
//        return tap
    
    //MARK: objc funcs
    @objc private func goBack() {
        guard let firstScreen = firstScreen else { return }
        firstScreen.setContactList(contactList)
        self.navigationController?.popViewController(animated: true)
        //self.dismiss(animated: true, completion: nil)
    }
    
    @objc private func editContact() {
        
        guard let firstName = nameTextField.text, let lastName = lastNameTextField.text, let phone = phoneTextField.text else { return }
        
        if !firstName.isEmpty || !lastName.isEmpty {
            let contact = Contact(name: firstName, lastName: lastName, phone: phone)
            contactList[contactID] = contact
            setupAlert(title: "Success", message: "Contact updated!")
        } else {
            setupAlert(title: "ERROR", message: "At least inform a 'Name' or a 'Last Name' for the contact")
        }
    }
    
    @objc private func favoriteSelected() {
        print("a")
        favoriteImageView.image = .checkmark
        contactList[contactID].isFavorite = true
    }

}
