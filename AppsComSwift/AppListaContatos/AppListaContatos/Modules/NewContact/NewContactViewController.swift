//
//  NewContactViewController.swift
//  AppListaContatos
//
//  Created by Squad Apps on 20/07/23.
//

import UIKit

class NewContactViewController: UIViewController {
    
    private var contactList:[Contact] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        // Do any additional setup after loading the view.
    }
    
    private func setupNavigationBar(){
        //2 buttons
        let cancelButton = UIBarButtonItem(
            barButtonSystemItem: .cancel,
            target: self,
            action: #selector(goBack))
        cancelButton.tintColor = .white
        
        let addContact = UIBarButtonItem(
            barButtonSystemItem: .done,
            target: self,
            action: nil)
        
        self.navigationItem.leftBarButtonItem = cancelButton
        self.navigationItem.rightBarButtonItem = addContact
    }
    
    @objc private func goBack() {
        navigationController?.popViewController(animated: true)
        //self.dismiss(animated: true, completion: nil)
    }

    @objc private func newContact(firstName:String?, lastName:String?, phone:String?){
        guard let firstName = firstName, let lastName = lastName, let phone = phone else {
            return
        }
    }
    
}
