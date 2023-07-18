//
//  ViewController.swift
//  testezin
//
//  Created by Squad Apps on 13/06/23.
//

import UIKit


//MARK: Inicial
class MainViewController: HelpController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    
    //variables OF THIS VIEWCONTROLLER (remember that this is a class)
    
    //my 'database'
    var contactList: [Contact] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //phoneTextField.keyboardType = .numberPad --> didn't work :(
    }
    
    //MARK:Save contact
    //EN => func to create and save a contact in the array
    @IBAction func saveContact(_ sender: UIButton) {
        //PT-BR => Func que irá instanciar um objeto do tipo 'Contact', que irá receber os valores dos textFields, e adicionar esse objeto à Array
        
        guard let name = nameTextField.text, let number = phoneTextField.text else { return }
        
        if !name.isEmpty && !number.isEmpty { //EN => validate if the textfields are empty
            if validateInputs(name, number) { //EN => validate if the value of the textfields are right
                
                //EN => i did 2 diferent 'if/else' validations because the 'else's return diferent types of alerts (the message of the alerts are diferent because the error's are also diferent's)
                
                let newContact:Contact = Contact(name,number) //PT-BR => cria um novo contato a partir dos dados dos text fields
                if !newContact.validateIfContactAlreadyExist(contactList) { //PT-BR => verifica se o contato já existe
                    print(newContact.showInfos())
                    contactList.append(newContact)
                    print(contactList)
                    setupAlert(title: "Sucesso!", message: "contato cadastrado com sucesso")
                    cleanTextsFields()
                } else { //EN => error if the contact(infos) already exist in the Array
                    setupAlert(title: "ERRO!", message: "O contato informado já existe")
                }
            } else { //EN => error if the infos informed are not right (name has to have only letters a-z and/or A-Z and phone must be only numbers 0-9)
                setupAlert(title: "ERRO!", message: "Verifique os dados digitados e tente novamente")
            }
        } else { //EN => error informing that all the fields need to be filled
            setupAlert(title: "ERRO!", message: "Todos os campos devem ser preenchidos")
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
    
    //func to clean the textFields
    func cleanTextsFields() {
        nameTextField.text = ""
        phoneTextField.text = ""
    }
    /*
    //MARK: Validar Contato
    //func to validate if a contact already exist in the contactList
    func validadeIfContactAlreadyExist(_ contatin: Contact) -> Bool {
        var result:Bool = false //to set my bool return of the func
        
        contactList.forEach { contato in
            if ((contatin.name == contato.name) && (contatin.phone == contato.phone) ) {
                result = true
                return
            }
        }
        return result
    }
    */
}

//MARK: Delegate
//my MainViewControler will inherit the protocol Delegate to allow me to pass data between the ViewController's
extension MainViewController: toPassDataDelegate {
    func setContactList(_ list:[Contact]) {
        self.contactList = list
    }
    //optional func, its just to see if the data is passing by the screen's
    func showContactInfos() -> String {
        guard let texto = contactList.first?.showInfos() else { return "Nada" }
        return texto
    }
}
