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
        setupSearchBar()
        setupTableView()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print(contactList.first?.showInfos() ?? "nada")
        tableView.reloadData()
    }
    
    //MARK: setup TableView
    private func setupTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ContactsTableViewCell", bundle: nil), forCellReuseIdentifier: "ContactsCell")
    }
    
    //MARK: setup NavBar
    private func setupNavigationBar() {
        //let newContactButton = UIBarButtonItem(title: "New Contact", style: .done, target: self, action: nil)
        navigationItem.title = "Contacts"
        
        let newContactButton = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(newScreen))
        
        self.navigationItem.rightBarButtonItem = newContactButton
    }
    
    //MARK: objc funcs
    @objc private func newScreen() {
        let newContact = UIStoryboard(name: "NewContact", bundle: nil).instantiateViewController(withIdentifier: "NewContact") as! NewContactViewController
        newContact.initView(contactList, firstScreen: self)
        self.navigationController?.pushViewController(newContact, animated: true)
    }
    
    //MARK: setup searchBar
    private func setupSearchBar() {
        searchBar.isTranslucent = true
        searchBar.backgroundColor = .systemBackground
        searchBar.searchTextField.backgroundColor = UIColor(named: "searchBarColor")
        searchBar.tintColor = UIColor(named: "adaptDarkLightMode")
    }

}

//MARK: TableView
extension ContactListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactsCell", for: indexPath) as! ContactsTableViewCell
        let contact = contactList[indexPath.row]
        cell.bind(cell: contact)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        guard let selectedCell = tableView.cellForRow(at: indexPath) else { return }
//        selectedCell.imageView?.backgroundColor = UIColor(named: "adaptGreenColor")
//        selectedCell.textLabel?.backgroundColor = UIColor(named: "adaptGreenColor")
        
        //abrir tela edição do contato
        let editContactSB = UIStoryboard(name: "EditContact", bundle: nil)
        let editContactVC = editContactSB.instantiateViewController(withIdentifier: "EditContact") as! EditContactViewController
        self.navigationController?.pushViewController(editContactVC, animated: true)
    }
    
}

//MARK: ContactList Delegate
extension ContactListViewController: ContactListDelegate {
    func setContactList(_ contactList: [Contact]) {
        self.contactList = contactList
    }
}
