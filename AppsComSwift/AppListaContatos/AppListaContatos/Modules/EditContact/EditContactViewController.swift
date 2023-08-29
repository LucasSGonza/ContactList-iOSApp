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
    @IBOutlet weak var trashImageView: UIImageView!
    @IBOutlet weak var phoneImageView: UIImageView!
    
    //MARK:Pass & Receive Data
    private var contactList:[Contact] = []
    private var delegate:ContactListDelegate?
    private var contact:Contact?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextFields()
        setupNavigationBar()
        setupIconActions()
        
        guard let contact = contact else {return }
        print(contact.isFavorite)
        favoriteImageView.image = contact.isFavorite ? UIImage(systemName: "bookmark.fill") : UIImage(systemName: "bookmark")
    }
    
    //MARK: InitView
    func initView(contact:Contact, contactList:[Contact], delegate:ContactListDelegate) {
        self.contact = contact
        self.contactList = contactList
        self.delegate = delegate
    }
    
//    private func myContact() -> Contact? {
//        guard let contact = contact else { return nil}
//        return contact
//    }
    
    //MARK: Icon actions
    private func setupIconActions() {
        
        let tapFavorite = UITapGestureRecognizer(target: self, action: #selector(favoriteContact))
        favoriteImageView.addGestureRecognizer(tapFavorite)
        
        let tapTrash = UITapGestureRecognizer(target: self, action: #selector(deleteContact))
        trashImageView.addGestureRecognizer(tapTrash)
        
//        let tapCall = UITapGestureRecognizer(target: self, action: #selector(callContact))
//        phoneImageView.addGestureRecognizer(tapCall)
    }
    
    
    //MARK: TextFields
    private func setupTextFields() {
        //procura Array pelo id
        guard let contact = contact else { return }
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
            action: #selector(confirmEdition))
        doneButton.tintColor = UIColor(named: "buttonsTabBar")
        doneButton.setTitleTextAttributes(
            [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 20.0)],
            for: .normal)
        
        self.navigationItem.leftBarButtonItem = cancelButton
        self.navigationItem.rightBarButtonItem = doneButton
    }

    //MARK: goBack
    //volta para dashboard
    @objc private func goBack() {
        guard let delegate = delegate else { return }
        delegate.setContactList(contactList)
        self.navigationController?.popViewController(animated: true)
        //self.dismiss(animated: true, completion: nil)
    }
    
    //MARK: confirmEdition
    //confirma a edição do contato
    @objc private func confirmEdition() {
        guard let firstName = nameTextField.text, let lastName = lastNameTextField.text, let phone = phoneTextField.text, let contact = contact else { return }
        
        if !firstName.isEmpty || !lastName.isEmpty {
            let newContact = Contact(name: firstName, lastName: lastName, phone: phone)
            contactList[contact.getID()] = newContact
            setupAlert(title: "Success", message: "Contact updated!")
        } else {
            setupAlert(title: "ERROR", message: "At least inform a 'Name' or a 'Last Name' for the contact")
        }
    }
    
    //MARK: favorite
    //favorita ou desfavorita o contato
    @objc private func favoriteContact() {
        guard let contact = contact else {return }
        
        if contact.isFavorite {//contact is favorite? when click will become not favorite
            contact.isFavorite = false
            favoriteImageView.image = UIImage(systemName: "bookmark")
        } else {
            contact.isFavorite = true
            favoriteImageView.image = UIImage(systemName: "bookmark.fill")
        }
        print(contact.isFavorite)
    }
    
    //MARK: Delete
    //deletar contato
    @objc private func deleteContact() {
        print(contactList)
        guard let contact = contact else { return }
        contactList.removeAll(where: {$0.getID() == contact.getID()})
        setupAlert(title: "Sucess!", message: "Contact deleted with success", completion: { self.goBack() })
        print(contactList)
        
    }

}
