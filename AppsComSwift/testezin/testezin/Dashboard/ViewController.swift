//
//  ViewController.swift
//  testezin
//
//  Created by Squad Apps on 13/06/23.
//

import UIKit

//botão pra geral usar -> talvez não seja legal fazer isso
let okButton = UIAlertAction(title: "OK", style: .default)


//MARK: Inicial
class ViewController: UIViewController {
    
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
        if (name != "" && number != "") { //verificar se o campos estão vazios
            if validateInputs(name, number) { //valida os tipos dos inputs
                let newContact:Contact = Contact(name, Int(number)!) //cria um novo contato a partir dos dados dos text fields
                if !validadeIfContactAlreadyExist(newContact) { //verifica se o contato já existe
                    print(newContact.showInfos()) //showInfos do novo contato
                    contactList.append(newContact) //add na Array (bd)
                    print(contactList) //exibe a Array
                    alertSuccessMessage("saveContact") //exibe mensagem de sucesso
                    cleanTextsFields() //limpa os textfields
                } else {
                    alertErrorMessage("contactAlreadyExist")
                }
            } else {
                alertErrorMessage("inputError")
            }
        } else {
            alertErrorMessage("inputEmpty")
        }
            
        
    }
    
    //MARK:Go to 2 screen
    
    //func to 'call' my other ViewController
    @IBAction func readContactList(_ sender: UIButton) {
        //new screen
        let screenContactList = storyboard?.instantiateViewController(identifier: "contactListScreen") as! ViewController2
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
            alertSuccessMessage("cleanList") //exibe mensagem de sucesso
            cleanTextsFields()
        } else {
            alertErrorMessage("listIsEmpty")
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
            if ( (contatin.name == contato.name) && (contatin.number == contato.number) ) {
                result = true
                return
            }
            
        }
        return result
    }
    
    
}


//MARK: Delegate
//a class(View) que herdará o protocol Delegate deve ser, no meu caso, a ViewController 1, portanto, a view que
extension ViewController: toPassDataDelegate {
    func setContactList(_ list:[Contact]) {
        self.contactList = list
    }
    func showContactInfos() -> String {
        guard let texto = contactList.first?.showInfos() else {return "Nada"}
        return texto
    }
}


//MARK: Alerts
extension ViewController: MyAlerts {
    //alert's of success
    func alertSuccessMessage(_ alertFlag: String) {
        let successMessage = UIAlertController(title: "Sucesso!", message: "", preferredStyle: .alert)
        successMessage.addAction(okButton)
        
        switch alertFlag {
        case "saveContact":
            successMessage.message = "Êxito em salvar o contato"
            break
            
        case "cleanList":
            successMessage.message = "Êxito em limpar a lista de contatos!"
            break
        
        default:
            successMessage.message = "Êxito na operação!"
            break
        }
        
        self.present(successMessage, animated: true, completion: nil)
    }
    
    //alert of error
    func alertErrorMessage(_ alertFlag: String) {
        let errorMessage = UIAlertController(title: "ERRO!", message: "", preferredStyle: .alert)
        errorMessage.addAction(okButton)
         
        //verifica oq esta vazio, para saber onde esta o erro
        switch alertFlag {
        case "inputEmpty":
            if nameTextField.text == "" && phoneTextField.text == "" {
                errorMessage.message = "Os campos estão vazios!"
            } else if nameTextField.text == "" {
                errorMessage.message = "Verifique o campo 'Name' e tente novamente!"
            } else if phoneTextField.text == "" {
                errorMessage.message = "Verifique o campo 'Phone' e tente novamente!"
            }
            break
            
        case "inputError":
            errorMessage.message = "Erro na validação dos campos! Verifique-os e tente novamente!"
            break
            
        case "contactAlreadyExist":
            errorMessage.message = "O contato informado já está registrado!"
            break
            
        case "listIsEmpty":
            errorMessage.message = "A lista de contatos está vazia!"
            break
            
        default:
            errorMessage.message = "Verifique os dados e tente novamente"
            break
        }
        
        self.present(errorMessage, animated: true, completion: nil)
    }
}
