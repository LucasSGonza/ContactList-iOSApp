//
//  ViewController2.swift
//  testezin
//
//  Created by Squad Apps on 27/06/23.
//

import UIKit

class ContactViewController: UIViewController {

    @IBOutlet weak var tabelaView: UITableView!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var phoneTextField: UITextField!
    
    //Variavel para facilitar no uso do ID da xib
    private let contactCellID = "ContactsTableViewCell"
    
    
    //MARK: Atributos
    //Delegate -> 'objeto' que será do tipo do protocol, para poder utilizar de seus métodos e atributos
    private var delegate: toPassDataDelegate?
    
    //Array que será cópia do meu bd na 1 ViewController
    private var contactList:[Contact] = []


    //método para no momento de instanciar a segunda tela, poder pegar os dados que estão vindo da primeira tela, no caso a Array(bd) e o próprio delegate
    func initView(_ list:[Contact], delegate2:toPassDataDelegate){
        self.contactList = list
        self.delegate = delegate2
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        //delegate?.setContactList(contactList) //necessario?
    }
    
    
    //definir quais serão a Delegate e a DataSoucer da minha tableView
    private func setupTableView() {
        tabelaView.delegate = self
        tabelaView.dataSource = self
        tabelaView.register(UINib.init(nibName: contactCellID, bundle: nil), forCellReuseIdentifier: contactCellID)
    }
    
    
    //func to clean the textFields
    func cleanTextsFields() {
        nameTextField.text = ""
        phoneTextField.text = ""
    }
    
    
    //MARK: Retornar para tela inicial
    //func do botão para retornar para 1 ViewController
    @IBAction func goBack(_ sender: Any) {
        guard let delegate = delegate else {return}
        delegate.setContactList(contactList)
        navigationController?.popViewController(animated: true)
        dismiss(animated: true)
    }
    
    //MARK: Validar Contato
    func validadeIfContactAlreadyExist(_ contatin: Contact) -> Bool {
        var result:Bool = false
        
        contactList.forEach { contato in
            if ( (contatin.name == contato.name) && (contatin.phone == contato.phone) ) {
                result = true
                return
            }
            
        }
        return result
    }
    
    
    //MARK: Editar contato
    @IBAction func editContactList(_ sender: UIButton) {
        //verificar os itens dos inputs para buscar na Array e se os dados baterem, atualiza-los
        if let name = nameTextField.text , let phone = phoneTextField.text, let index = tabelaView.indexPathForSelectedRow?.row {
            print("b")
            
            guard let newContact: Contact = contactList.first(where: { $0.phone == phone || $0.name == name }) else {return}
            
            print(newContact.showInfos() + "\nindex: \(index)")
            newContact.updateContact(name: name, phone: phone)
            print(newContact.showInfos() + "\nindex: \(index)")
            
            //if para verificar se o contato atualizado n ficou exatamente igual à algum outro já presente na Array
            if !validadeIfContactAlreadyExist(newContact) {
                contactList[index] = newContact
                print(contactList)
                
                setupAlert(title: "Sucesso!", message: "contato atualizado com sucesso")
            } else {
                setupAlert(title: "ERRO!", message: "Já existe um contato salvo com estes dados")
                cleanTextsFields()
            }
            
        } else {
            setupAlert(title: "ERRO!", message: "Verifique os dados e tente novamente")
            cleanTextsFields()
        }//fim do if let
            
        tabelaView.reloadData()
    }//fim da ação do botão
    
    
    //MARK: Deletar contato
    @IBAction func deleteContact(_ sender: UIButton) {
        guard let name = nameTextField.text, let phone = phoneTextField.text else {return}
        
        var i: Int = 0
        if !contactList.isEmpty {
            contactList.forEach { contato in
                if name == contato.name && phone == contato.phone {
                    contactList.remove(at: i)
                    print(contactList)
                    setupAlert(title: "Sucesso!", message: "Contato removido com sucesso")
                    cleanTextsFields()
                    //
                    return
                } else {i = i + 1}
            }
        } else {
            setupAlert(title: "ERRO!", message: "Lista de contatos está vazia")
        }
        tabelaView.reloadData()
    }
    
}


// MARK: TableView methods
extension ContactViewController: UITableViewDelegate, UITableViewDataSource {
    
    //Aparentemente o nome do segundo parâmetro define oq a função irá definir/editar/exibir
    
    //func que irá definir o número de Rows da tableView (numbersOfRowsInSection)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactList.count
    }
    
    
    //func que irá inserir dados na tableView (cellForRowAt) -> célula para linha em x índice
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tabelaView.dequeueReusableCell(withIdentifier: contactCellID, for: indexPath) as! ContactsTableViewCell
        let contato = contactList[indexPath.row]
        cell.bind(item: contato)
        return cell
    }
    
    
    //func que irá pegar os dados da Row selecionada e exibir nos inputs (didSelectRowAt)
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        nameTextField.text = contactList[indexPath.row].name
        phoneTextField.text = contactList[indexPath.row].phone.description
    }

}


//MARK: Alerts
extension ContactViewController: MyAlerts {
    func setupAlert(title:String, message:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true, completion: nil)
    }
}
