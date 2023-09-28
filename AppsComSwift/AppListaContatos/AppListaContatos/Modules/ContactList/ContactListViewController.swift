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
    
    
    @IBAction func goToTeste(_ sender: Any) {
        let testeVC = UIStoryboard(name: "TesteScrollView", bundle: nil).instantiateViewController(withIdentifier: "TesteScrollViewController") as! TesteScrollViewController
        self.navigationController?.pushViewController(testeVC, animated: true)
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
        setupFavoriteListToDefault()
        searchBar.text = ""
        tableView.reloadData()
    }
    
    //MARK: Default list state
    //reseta a listaFiltrada para estado 'padrão' ( = contactList)
    private func setupFavoriteListToDefault() {
        filterData.removeAll()
        filterData.append(contentsOf: contactList)
    }
    
    //MARK:Favorite List
    @objc private func changeList() {
        // se o favorito nao estiver selecionado, selecioná-lo
        if isFavoriteListSelected == false {
            listImageView.image = UIImage(systemName: "text.book.closed.fill")
            favoriteImageView.image = UIImage(systemName: "star.fill")
            
            isFavoriteListSelected = true
            filterData = filterData.filter { $0.isFavorite }
            
        } else {
            listImageView.image = UIImage(systemName: "text.book.closed")
            favoriteImageView.image = UIImage(systemName: "star")
            
            isFavoriteListSelected = false
            setupFavoriteListToDefault()
        }
        tableView.reloadData()
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
        
        setupFavoriteListToDefault()
        
        if isFavoriteListSelected {
            filterData = filterData.filter{ $0.isFavorite }
        }
        
        if !searchText.isEmpty {
            filterData = filterData.filter {
                ($0.getName().lowercased().contains(searchText.lowercased())) || ($0.getLastName().lowercased().contains(searchText.lowercased())) || ($0.getPhone().contains(searchText))
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
        return 65
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("a")
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    //MARK: Delete Contact
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        print("deletando...")
        
        //salva o contato a ser deletado pois o indexPath muda conforme a lista tbm muda (favorite ou default)
        let contactToDelete:Contact = filterData[indexPath.row]
        
        if editingStyle == .delete {
            tableView.beginUpdates()
            
            tableView.deleteRows(at: [indexPath], with: .fade)
            filterData.remove(at: indexPath.row)
            //filterData sempre estará igual o indexPath, mas a contactList n, uma vez que se a lista estiver filtrada, o index dos itens muda (ainda mais visto que na contactList esse index se mantem padrão)
            contactList.removeAll(where: {$0.getID() == contactToDelete.getID()})
            
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

/*
MARK:Problemas
 
 1. searchBar => quando eu pesquiso por um nome na searchBar, ocorreu um 1 filtro na filterData. Contudo, caso eu selecione o icone para filtrar os favoritos, ocorre um 2° filtro, tendo o 1° filtro de base, ou seja, filtra os contatos favoritos, dentro os contatos procurados na searchBar.
 */
