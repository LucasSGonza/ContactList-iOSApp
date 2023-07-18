//
//  ViewController2.swift
//  testezin
//
//  Created by Squad Apps on 27/06/23.
//

import UIKit

class ContactViewController: HelpController {

    @IBOutlet weak var tabelaView: UITableView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    
    //MARK: Attributes
    //PT-BR => Delegate -> 'objeto' que será do tipo do protocol, para poder utilizar de seus métodos e atributos
    private var delegate: toPassDataDelegate?
    
    //PT-BR => Array que será cópia do meu bd na MainViewController
    private var contactList:[Contact] = []

    //MARK: Delegate
    //PT-BR => método para no momento de instanciar a segunda tela, poder pegar os dados que estão vindo da primeira tela, no caso a Array(bd) e o próprio delegate
    //EN => this method is being used in the MainViewController to, in the moment when this ContactViewController is called, the MainViewControler can pass the contactList and the delegate with content to this ViewController
    func initView(_ list:[Contact], delegate2:toPassDataDelegate){
        self.contactList = list
        self.delegate = delegate2
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    //MARK: TableView Setup
    //PT-BR => definir quais serão a Delegate e a DataSoucer da minha tableView, além de registrar o uso da xib como cell da tabela
    //EN => will setup my tableView (define the delegate, datasource and cell type)
    private func setupTableView() {
        tabelaView.delegate = self
        tabelaView.dataSource = self
        tabelaView.register(UINib.init(nibName: "ContactsTableViewCell", bundle: nil), forCellReuseIdentifier: "ContactsTableViewCell")
    }
    
    //EN => func to clean the textFields
    func cleanTextsFields() {
        nameTextField.text = ""
        phoneTextField.text = ""
    }
    
    //MARK: Return to MainVC
    //PT-BR => func do botão para retornar para 1 ViewController
    @IBAction func goBack(_ sender: Any) {
        guard let delegate = delegate else {return}
        delegate.setContactList(contactList)
        navigationController?.popViewController(animated: true)
        dismiss(animated: true)
    }
    /*
    //MARK: Validate Contact
    //EN => func to validate if a contact already exist in the contactList
    func validateIfContactAlreadyExist(_ contatin: Contact) -> Bool {
        var result:Bool = false
        
        contactList.forEach { contato in
            if ((contatin.name == contato.name) && (contatin.phone == contato.phone) ) {
                result = true
                return
            }
        }
        return result
    }
     */
    
    //MARK: Edit Contact
    /*
     EN => action button that will receive infos from the textFields and FROM THE SELECTION of a contact in the tableView to update a contact in the contactList
     
     PT-BR => verificar os itens dos inputs para buscar na Array e se os dados baterem, atualiza-los
    */
    
    @IBAction func editContactList(_ sender: UIButton) {
        if let name = nameTextField.text , let phone = phoneTextField.text, let index = tabelaView.indexPathForSelectedRow?.row {
            /*
             EN =>
             Create a 'new' contact. This contact will receive the infos from the inputs (attempt to the index, because in fact this func will update the contact that was previous and necessarily selected in the table view
            The index will determinate where will be updated (the position in the array that will be updated - receiving a new contact)
             
            PT-BR => Cria um novo obj contact com os dados do input, faz as verificações e atualiza na posição da array baseada na posição do objeto selecionado na table view
             */
            
            let contactToEdit:Contact = .init(name, phone)
            
            print(contactToEdit.showInfos() + "\nindex: \(index)")
            
            //PT-BR => if para verificar se já existe um contato com os dados iguais ao 'atualizado'
            if !contactToEdit.validateIfContactAlreadyExist(contactList) {
                contactList[index] = contactToEdit
                setupAlert(title: "Sucesso!", message: "contato atualizado com sucesso")
                cleanTextsFields()
            } else { //EN => error if already exist a contact in the array exactly equal with the updated contact
                setupAlert(title: "ERRO!", message: "Já existe um contato salvo com estes dados")
            }
            
            print(contactToEdit.showInfos() + "\nindex: \(index)")
            tabelaView.reloadRows(at: [IndexPath(row: index, section: 0)], with: .fade)
            
        } else { //EN => error if the user didn't selected any contact in the tableView
            setupAlert(title: "ERRO!", message: "Para editar, primeiro selecione um contato")
            cleanTextsFields()
        }//PT-BR => fim do if let
    }//PT-BR => fim da ação do botão
    
    //MARK: Delete contact
    /*
     EN =>
     
     This func is similar with the editContact func: will search for a contact with the data received from the inputs.
     
     But, in this case, i used a different logical: will be removed the contact that have the exactly infos informed IN THE TEXTFIELDS and only from that, so doesn't matter the contact selected in the tableView. What only matter here is the infos from the textfields.
     
     And why that? Because if i use the logical from the editContact, could happen a situation where the selected contact was one, but the user changed the value of the inputs to other contact, and the function would delete the selected contact, and not the contact with the infos informed in the textFields. Here's a example:
     
     Contacts: 'Lucas, 123' and 'Pedro,321'
     1. User select in the tableView 'Lucas,123'
     2. User change the infos of the textFields to 'Pedro,321'
     
     Clicking in editContact would not work, because would info the error: 'user already exist'. But, in deleteContact, would work, but in this way:
     
     3. User click in 'Remover contato'(Delete Contact), and the app remove the contact 'Lucas,123', ignoring the infos writed in the textFields
     
     */
    @IBAction func deleteContact(_ sender: UIButton) {
        if let name = nameTextField.text, let phone = phoneTextField.text {
            
            var contactIndex: Int = 0
            var foundContact: Bool = false
            
            if !contactList.isEmpty {
                if !name.isEmpty && !phone.isEmpty {
                    
                    /*
                     EN =>
                     here is a similar situation on the saveContact action button in the MainViewController: will validate first if the contactlist is empty and then if the textFields are also empty's, and for both return a alert informing the error (if he exist)
                     One difference in particular here, ignoring the main objective of the func's (save/delete), is that here i didn't need to validate if the infos (name and phone) informed in the textFields are right, because, if not, will not match with any contact in the contactList, so will already return an error (alert).
                     At least i think that i don't need to validate that, because will return a error anyway, even if in a 100% right situation they are different error's.
                    */
                    
                    contactList.forEach { contato in
                        if name == contato.name && phone == contato.phone {
                            contactList.remove(at: contactIndex)
                            print(contactList)
                            foundContact = true
                            cleanTextsFields()
                            //
                            return
                        } else {contactIndex = contactIndex + 1}
                    }
                    //EN => ternary operator to define the alert that will be displayed to the user -> if the contact that the user wants to remove exist or not in the contactList
                    foundContact ? setupAlert(title: "Sucesso!", message: "Contato removido com sucesso") : setupAlert(title: "ERRO!", message: "Não existe um contato com os dados informados")
                    
                } else { //EN => error if the textFields are empty
                    setupAlert(title: "ERRO!", message: "Informe os dados do contato a ser removido")
                }
                
            } else { //EN => error if the contactList is already empty
                setupAlert(title: "ERRO!", message: "Lista de contatos está vazia")
            }
        }
        tabelaView.reloadData()
    }
    
    //EN => func to the phone number of the informed contact
    @IBAction func callContact(_ sender: UIButton) {
        if let phone = phoneTextField.text, !phone.isEmpty{
            if let url = URL(string: "tel://\(phone)"), UIApplication.shared.canOpenURL(url) {
                    UIApplication.shared.open(url)
            }
        }
    }
    
}

// MARK: TableView methods
extension ContactViewController: UITableViewDelegate, UITableViewDataSource {
    
    //PT-BR => Aparentemente o nome do segundo parâmetro define oq a função irá definir/editar/exibir
    
    //PT-BR => func que irá definir o número de Rows da tableView (numbersOfRowsInSection)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactList.count
    }
    
    //PT-BR => func que irá inserir dados na tableView (cellForRowAt) -> célula para linha em x índice
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tabelaView.dequeueReusableCell(withIdentifier: "ContactsTableViewCell", for: indexPath) as! ContactsTableViewCell
        let contato = contactList[indexPath.row]
        cell.bind(item: contato)
        return cell
    }
    
    //PT-BR => func que irá pegar os dados da Row selecionada e exibir nos inputs (didSelectRowAt)
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        nameTextField.text = contactList[indexPath.row].name
        phoneTextField.text = contactList[indexPath.row].phone
    }

}
