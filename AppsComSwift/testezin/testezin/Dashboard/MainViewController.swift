//
//  ViewController.swift
//  testezin
//
//  Created by Squad Apps on 13/06/23.
//

import UIKit


//MARK: Inicial
class MainViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var phoneTextField: UITextField!
    
    
    //variables OF THIS VIEWCONTROLLER (remember that this is a class)
    
    //my database
    var contactList: [Contact] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setContactList(contactList)
        //phoneTextField.keyboardType = .numberPad
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print(contactList)
    }
    
    
    //MARK:Save contact
    //func to save the contact in the array
    @IBAction func saveContact(_ sender: UIButton) {
        //Instanciar um objeto do tipo 'Contact', que irá receber os valores dos textFields
        guard let name = nameTextField.text, let number = phoneTextField.text else {return}
        if (!name.isEmpty && !number.isEmpty) { //verificar se o campos estão vazios
            if validateInputs(name, number) { //valida os tipos dos inputs
                let newContact:Contact = Contact(name,number) //cria um novo contato a partir dos dados dos text fields
                if !validadeIfContactAlreadyExist(newContact) { //verifica se o contato já existe
                    print(newContact.showInfos()) //showInfos do novo contato
                    contactList.append(newContact) //add na Array (bd)
                    print(contactList) //exibe a Array
                    setupAlert(title: "Sucesso!", message: "contato cadastrado com sucesso")//exibe mensagem de sucesso
                    cleanTextsFields() //limpa os textfields
                } else {
                    setupAlert(title: "ERRO!", message: "O contato informado já existe")
                }
            } else {
                setupAlert(title: "ERRO!", message: "Verifique os dados digitados e tente novamente")
            }
        } else {
            setupAlert(title: "ERRO!", message: "Os campos estão vazios")
        }
            
        
    }
    
    //MARK:Go to 2 screen
    
    //func to 'call' my other ViewController
    @IBAction func readContactList(_ sender: UIButton) {
        //new screen
        let screenContactList = storyboard?.instantiateViewController(identifier: "contactListScreen") as! ContactViewController
        screenContactList.initView(contactList, delegate2: self)
        navigationController?.pushViewController(screenContactList, animated: true)
    }

    
    //MARK: Clean List
    //func to clean the Array Contact List
    @IBAction func cleanList(_ sender: UIButton) {
        if !contactList.isEmpty {
            print("Limpando lista...")
            contactList.removeAll() //limpa a Array
            print(contactList)
            setupAlert(title: "Sucesso!", message: "Lista de contatos removida com sucesso") //exibe mensagem de sucesso
            cleanTextsFields()
        } else {
            setupAlert(title: "ERRO!", message: "Lista de contatos já está vazia")
        }
    }
    
    
    //func to clean the textFields -> using in func saveContact
    func cleanTextsFields() {
        nameTextField.text = ""
        phoneTextField.text = ""
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
    
}


//MARK: Delegate
//a class(View) que herdará o protocol Delegate deve ser, no meu caso, a ViewController 1, portanto, a view que
extension MainViewController: toPassDataDelegate {
    func setContactList(_ list:[Contact]) {
        self.contactList = list
    }
    func showContactInfos() -> String {
        guard let texto = contactList.first?.showInfos() else {return "Nada"}
        return texto
    }
}


//MARK: Alerts
extension MainViewController: MyAlerts {
    //alert's of success
    func setupAlert(title: String, message:String) {
        let alert: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true, completion: nil)
    }
}
