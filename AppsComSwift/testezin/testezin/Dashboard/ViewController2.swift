//
//  ViewController2.swift
//  testezin
//
//  Created by Squad Apps on 27/06/23.
//

import UIKit

class ViewController2: UIViewController{

    @IBOutlet weak var tabelaView: UITableView!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var phoneTextField: UITextField!
    
    
    //MARK: Atributos
    //Delegate -> 'objeto' que será do tipo do protocol, para poder utilizar de seus métodos e atributos
    private var delegate: toPassDataDelegate?
    
    //Array que será cópia do meu bd na 1 ViewController
    private var contactList:[Contact] = []
    
    private var alertFlag: String = ""
    
    
    //método para no momento de instanciar a segunda tela, poder pegar os dados que estão vindo da primeira tela, no caso a Array(bd) e o próprio delegate
    func initView(_ list:[Contact], delegate2:toPassDataDelegate){
        self.contactList = list
        self.delegate = delegate2
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        delegate?.getContactList(contactList)
        print(delegate!.showContactInfos())
    }
    
    
    //definir quais serão a Delegate e a DataSoucer da minha tableView
    private func setupTableView() {
        tabelaView.delegate = self
        tabelaView.dataSource = self
    }
    
    
    //func to clean the textFields -> using in func saveContact
    func cleanTextsFields() {
        nameTextField.text = ""
        phoneTextField.text = ""
    }
    
    
    //MARK: Retornar para tela inicial
    //func do botão para retornar para 1 ViewController
    @IBAction func goBack(_ sender: Any) {
        guard let delegate = delegate else {return}
        delegate.getContactList(contactList)
        navigationController?.popViewController(animated: true)
        dismiss(animated: true)
    }
    
    
    //MARK: Editar lista
    @IBAction func editContactList(_ sender: UIButton) {
        //verificar os itens dos inputs para buscar na Array e se os dados baterem, atualiza-los
        
        if let name = nameTextField.text , let phone = phoneTextField.text {
            
            contactList.forEach { contato in
                //se nome e número forem exatamente iguais, não alterar nada e exibir mensagem
                print(contato.showInfos())
                if name == contato.name && Int(phone) == contato.number {
                    alertFlag = "contactIsEqual"
                    alertErrorMessage()
                    cleanTextsFields()
                    return
                }
                //verificar se somente o phone se alterou
                else if name == contato.name && Int(phone) != contato.number {
                    //
                }
                //
            }//fim do forEach()
            
        } else {//fim do if let
            
        }
        
    }//fim da ação do botão
    
}

// MARK: TableView methods
extension ViewController2: UITableViewDelegate, UITableViewDataSource {
    
    //Aparentemente o nome do segundo parâmetro define oq a função irá definir/editar/exibir
    
    //func que irá definir o número de Rows da tableView (numbersOfRowsInSection)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactList.count
    }
    
    //func que irá inserir dados na tableView (cellForRowAt) -> célula para linha em x índice
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tabelaView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let contato = contactList[indexPath.row]
        cell.textLabel?.text = contato.name
        cell.detailTextLabel?.text = "\(contato.number)"
        return cell
    }
    
    //func que irá pegar os dados da Row selecionada e exibir nos inputs (didSelectRowAt)
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        nameTextField.text = contactList[indexPath.row].name
        phoneTextField.text = contactList[indexPath.row].number.description
    }

}

//MARK: Alerts
extension ViewController2: MyAlerts {
    func alertSuccessMessage() {
        let successMessage = UIAlertController(title: "Sucesso!", message: "", preferredStyle: .alert)
        successMessage.addAction(okButton)
         
        //verifica a mensagem de sucesso que irá exibir
        if alertFlag == "saveContact" {
            successMessage.message = "Êxito em salvar o contato"
        } else if alertFlag == "cleanList" {
            successMessage.message = "Êxito em limpar a lista de contatos!"
        }
        self.present(successMessage, animated: true, completion: nil)
    }
    
    func alertErrorMessage() {
        let errorMessage = UIAlertController(title: "ERRO!", message: "", preferredStyle: .alert)
        errorMessage.addAction(okButton)
         
        //verifica oq esta vazio, para saber onde esta o erro
        if alertFlag == "contactIsEqual" {
            errorMessage.message = "Os dados do contato procurado estão iguais!"
        }
        
        self.present(errorMessage, animated: true, completion: nil)
    }
    
}

