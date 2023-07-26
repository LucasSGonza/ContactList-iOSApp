//
//  ContactListViewController.swift
//  AppListaContatos
//
//  Created by Squad Apps on 20/07/23.
//

import UIKit

class ContactListViewController: UIViewController {

    private var contactList:[Contact] = []
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        searchBar.backgroundColor = .systemBackground
        searchBar.barTintColor = .green
        // Do any additional setup after loading the view.
    }
    
    private func setupNavigationBar(){
        //let newContactButton = UIBarButtonItem(title: "New Contact", style: .done, target: self, action: nil)
        navigationItem.title = "Contacts"
        
        let newContactButton = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(newScreen))
        
        self.navigationItem.rightBarButtonItem = newContactButton
    }
    
    @objc private func newScreen() {
        let newContact = UIStoryboard(name: "NewContact", bundle: nil).instantiateViewController(withIdentifier: "NewContact") as! NewContactViewController
        self.navigationController?.pushViewController(newContact, animated: true)
    }

}

extension ContactListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactsTableViewCell", for: indexPath) as! ContactsTableViewCell
        let contact = contactList[indexPath.row]
        cell.bind(cell: contact)
        return cell
    }
    
}
