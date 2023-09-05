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
    private var isFavoriteListSelected:Bool = false
    
    private var isSelected:Bool = false
    private var selectedIndex:Int?
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var listImageView: UIImageView!
    @IBOutlet weak var favoriteImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupSearchBar()
        setupTableView()
        setupIconActions()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setupScreenToDefaultState()
    }
    
    //MARK: setup TableView
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ContactTableViewCell", bundle: nil), forCellReuseIdentifier: "ContactCell")
        tableView.tableFooterView = UIView() //somente cria linhas de separação quando existem células na tableView
    }
    
    //MARK: setup NavBar
    private func setupNavigationBar() {
        navigationItem.title = "Contacts"
        
        let newContactButton = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(goToNewContact))
        
        self.navigationItem.rightBarButtonItem = newContactButton
    }
    
    //MARK: setup searchBar
    private func setupSearchBar() {
        searchBar.isTranslucent = true
        searchBar.backgroundColor = UIColor(named: "backgroundColor")
        searchBar.searchTextField.backgroundColor = UIColor(named: "searchBarColor")
        searchBar.tintColor = UIColor(named: "adaptDarkLightMode")
        searchBar.delegate = self /*necessario tal qual na tableView*/
    }
    
    //MARK: setup ImageView
    private func setupIconActions() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(changeList))
        listImageView.addGestureRecognizer(tap)
    }
    
    //MARK:Default Screen state
    //reseta a configuração da tela para 'padrão'
    private func setupScreenToDefaultState() {
        //default state => imagens não '.fill' , filterData = contactList
        listImageView.image = UIImage(systemName: "text.book.closed")
        favoriteImageView.image = UIImage(systemName: "star")
        filterData.removeAll()
        filterData.append(contentsOf: contactList)
        tableView.reloadData()
    }
    
    //MARK:Favorite List
    @objc private func changeList() {
        // se o favorito nao estiver selecionado, selecioná-lo
        if isFavoriteListSelected == false {
            listImageView.image = UIImage(systemName: "text.book.closed.fill")
            favoriteImageView.image = UIImage(systemName: "star.fill")
            filterData = filterData.filter { $0.isFavorite }
            isFavoriteListSelected = true
            tableView.reloadData()
        } else {
            listImageView.image = UIImage(systemName: "text.book.closed")
            favoriteImageView.image = UIImage(systemName: "star")
            isFavoriteListSelected = false
            filterData.removeAll()
            filterData.append(contentsOf: contactList)
            tableView.reloadData()
        }
        
    }
    
    //MARK: go to NewContactVC
    @objc private func goToNewContact() {
        let newContact = UIStoryboard(name: "NewContact", bundle: nil).instantiateViewController(withIdentifier: "NewContact") as! NewContactViewController
        newContact.initView(contactList, delegate: self)
        self.navigationController?.pushViewController(newContact, animated: true)
    }
    
}

// https://medium.com/@himanshunag/searchbar-in-swift-ios-14e66d8ce29d
//MARK: SearchBar
extension ContactListViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        
        filterData.removeAll()
        filterData.append(contentsOf: contactList)
        
        if isFavoriteListSelected {
            filterData = filterData.filter{ $0.isFavorite }
        }
        
        if !searchText.isEmpty {
            filterData = filterData.filter {
                ($0.getName().lowercased().contains(searchText.lowercased())) || ($0.getLastName().lowercased().contains(searchText.lowercased())) || ($0.getPhone().lowercased().contains(searchText.lowercased()))
            }
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
//        if isSelected && selectedIndex == indexPath.row {
//            return 130
//        }
        return 70
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath) as! ContactTableViewCell
        let contact = filterData[indexPath.row]
        
        cell.bind(item: contact, delegate: self)
        
        if contact.isFavorite {
            cell.favoriteImageView.isHidden = false
            cell.favoriteImageView.image = UIImage(systemName: "star.fill")
        } else {
            cell.favoriteImageView.isHidden = true
            cell.favoriteImageView.image = UIImage(systemName: "star")
        }
        return cell
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        if isSelected == false {
//            isSelected = true
//            selectedIndex = indexPath.row
//        } else {
//            isSelected = false
//            selectedIndex = -1
//        }
//        tableView.reloadRows(at: [indexPath], with: .automatic)
//    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    //MARK: Delete Contact
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        print("deletando...")
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
//MARK: EditContact Listener
extension ContactListViewController: EditContactDelegate {
    func goToEditContact(_ contact: Contact) {
        let editContactSB = UIStoryboard(name: "EditContact", bundle: nil)
        let editContactVC = editContactSB.instantiateViewController(withIdentifier: "EditContact") as! EditContactViewController
        editContactVC.initView(contact: contact, contactList: contactList, delegate: self)
        self.navigationController?.pushViewController(editContactVC, animated: true)
    }
}
