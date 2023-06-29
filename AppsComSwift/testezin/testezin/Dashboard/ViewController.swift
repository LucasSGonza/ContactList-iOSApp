//
//  ViewController.swift
//  testezin
//
//  Created by Squad Apps on 13/06/23.
//

import UIKit

//MARK: Inicial
class ViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var phoneTextField: UITextField!
    
    
    //variables OF THIS VIEWCONTROLLER (remember that this is a class)
    
    //my database
    var contactList: [Contact] = []
    
    //flag for my alert's to help to define the alert message of them
    var alertFlag: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getContactList(contactList)
        //phoneTextField.keyboardType = .numberPad
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print(showContactInfos())
    }
    
    
    //MARK:Save contact
    
    //func to save the contact in the array
    @IBAction func saveContact(_ sender: UIButton) {
        //Instanciar um objeto do tipo 'Contact', que irá receber os valores dos textFields
        if let name = nameTextField.text, let number = phoneTextField.text {
            
            if name != "" && number != "" { //verificar se number é numero
                
                alertFlag = "saveContact" //flag para o alerta
                let newContact:Contact = Contact(name, Int(number)!) //cria um novo contato a partir dos dados dos text fields
                print(newContact.showInfos()) //showInfos do novo contato
                contactList.append(newContact) //add na Array (bd)
                print(contactList) //exibe a Array
                alertSuccessMessage() //exibe mensagem de sucesso
                cleanTextsFields() //limpa os textfields
                
            } else {
                alertErrorMessage()//exibe mensagem de erro (na func há uma seleção do erro a ser exibido)
            }
            
        }
        
    }
    
    //MARK:Go to 2 screen
    
    //func to read the Array Contact List
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
            alertFlag = "cleanList"
            print("Limpando lista...")
            contactList.removeAll() //limpa a Array
            print(contactList)
            alertSuccessMessage() //exibe mensagem de sucesso
            cleanTextsFields()
        } else {
            alertErrorListIsEmpty()
        }
    }
    
    //func to clean the textFields -> using in func saveContact
    func cleanTextsFields() {
        nameTextField.text = ""
        phoneTextField.text = ""
    }
    

    //MARK: Alerts
    let okButton = UIAlertAction(title: "OK", style: .default)
    
    //alert's of success
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
    
    //alert of error
    func alertErrorMessage() {
        let errorMessage = UIAlertController(title: "ERRO!", message: "", preferredStyle: .alert)
        errorMessage.addAction(okButton)
         
        //verifica oq esta vazio, para saber onde esta o erro
        
        if nameTextField.text == "" && phoneTextField.text == "" {
            errorMessage.message = "Verifique os campos e tente novamente!"
        } else if nameTextField.text == "" {
            errorMessage.message = "Verifique o campo 'Name' e tente novamente!"
        } else if phoneTextField.text == "" {
            errorMessage.message = "Verifique o campo 'Phone' e tente novamente!"
        }
        
        self.present(errorMessage, animated: true, completion: nil)
    }
    
    //alert of error from clean a empty list
    func alertErrorListIsEmpty() {
        let errorMessage = UIAlertController(title: "ERRO!", message: "A lista de contatos está vazia!", preferredStyle: .alert)
        errorMessage.addAction(okButton)
        self.present(errorMessage, animated: true, completion: nil)
    }
    //End of alerts area
    
}

//MARK: Delegate
extension ViewController: toPassDataDelegate {
    func getContactList(_ list:[Contact]) {
        self.contactList = list
    }
    func showContactInfos() -> String {
        guard let texto = contactList.first?.showInfos() else {return "Nada"}
        return texto
    }
}
