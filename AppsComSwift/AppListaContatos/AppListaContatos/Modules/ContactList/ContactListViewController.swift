//
//  ContactListViewController.swift
//  AppListaContatos
//
//  Created by Squad Apps on 20/07/23.
//

import UIKit

class ContactListViewController: UIViewController {
    
    private var contactList:[Contact] = []
    
    /*
     Como a tableView é baseada na minha Array, e eu não devo mexer no meu 'bd'(contactList), eu crio uma array cópia, para que então eu possa alterar seus valores e consequentemente alterar oq esta sendo mostrado na tableView
     */
    private var filterData:[Contact] = []
    
    private var isSelected:Bool = false
    private var selectedIndex:Int?
    
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
        filterData.removeAll()
        filterData.append(contentsOf: contactList)
        tableView.reloadData()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
//        tableView.visibleCells.forEach { cell in
//            cell.contentView.backgroundColor = .none
//        }
    }
    
    //MARK: setup TableView
    private func setupTableView() {
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
        searchBar.backgroundColor = UIColor(named: "backgroundColor")
        searchBar.searchTextField.backgroundColor = UIColor(named: "searchBarColor")
        searchBar.tintColor = UIColor(named: "adaptDarkLightMode")
        searchBar.delegate = self /*necessario tal qual na tableView*/
    }
    
}

// https://medium.com/@himanshunag/searchbar-in-swift-ios-14e66d8ce29d
extension ContactListViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        filterData.removeAll()
        filterData.append(contentsOf: contactList)
        
        filterData = filterData.filter {
            ($0.getName().lowercased().contains(searchText.lowercased())) || ($0.getLastName().lowercased().contains(searchText.lowercased())) || ($0.getPhone().lowercased().contains(searchText.lowercased()))
        }
        
        tableView.reloadData()
    }
    
}

//MARK: TableView
extension ContactListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterData.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if isSelected && selectedIndex == indexPath.row {
            return 130
        }
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactsCell", for: indexPath) as! ContactsTableViewCell
        let contact = filterData[indexPath.row]
        cell.bind(cell: contact)
        cell.pencilSelected(contactListVC: self) //arrumar aqui
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if isSelected == false {
            isSelected = true
            selectedIndex = indexPath.row
        } else {
            isSelected = false
            selectedIndex = -1
        }
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            filterData.remove(at: indexPath.row)
            contactList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
        }
    }
    
}

//MARK: ContactList Delegate
extension ContactListViewController: ContactListDelegate {
    func setContactList(_ contactList: [Contact]) {
        self.contactList = contactList
    }
}
