//
//  ViewController.swift
//  testezin
//
//  Created by Squad Apps on 13/06/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var phoneTextField: UITextField!
    
    @IBOutlet weak var testeContato: UILabel!
    
    
    //variables
    var contactList: [Contact] = []
    
    
    //Life Cycle of the App
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        alertSuccessMessage()
        alertErrorMessage()
        phoneTextField.keyboardType = .asciiCapableNumberPad
    }
    
    
    //MARK: Function's
    
    //func to save the contact in the array
    @IBAction func saveContact(_ sender: UIButton) {
        //Instanciar um objeto do tipo 'Contact', que irá receber os valores dos textFields
        if let name = nameTextField.text, let number = phoneTextField.text {
            if name != "" && number != "" {
                let newContact:Contact = Contact(name, Int(number)!)
                print(newContact.showInfos())
                contactList.append(newContact)
                print(contactList)
                alertSuccessMessage()
                cleanTextsFields()
            } else {
                alertErrorMessage()
            }
        }

    }
    
    // func to read the Array Contact List
    @IBAction func readContactList(_ sender: UIButton) {
        if !contactList.isEmpty {
            testeContato.text = "Nome:\(contactList.first!.name)\nNúmero:\(contactList.first!.number)"
        }
        //new screen
        /*
        let screenContactList = storyboard?.instantiateViewController(identifier: "contactListScreen") as! ViewControllerContactList
        
        present(screenContactList, animated: true, completion: nil)
         */
        
    }
    
    //func to clean the Array Contact List
    @IBAction func cleanList(_ sender: UIButton) {
        testeContato.text = ""
        //contactList.removeAll()
    }
    
    //func to clean the textFields -> using in func saveContact
    func cleanTextsFields() {
        nameTextField.text = ""
        phoneTextField.text = ""
    }
    
    
    //MARK: Alerts area
    let okButton = UIAlertAction(title: "OK", style: .default)
    
    func alertSuccessMessage() {
        let successMessage = UIAlertController(title: "Sucesso!", message: "êxito em salvar o contato", preferredStyle: .alert)
        //(title: String?, message: String?, preferredStyle: UIAlertController.Style)
        
        successMessage.addAction(okButton)
        
        //(title: String?, style: UIAlertAction.Style, handler: ((UIAlertAction) -> Void)? = nil)
        
        self.present(successMessage, animated: true, completion: nil)
    }
    
    func alertErrorMessage(){
        let errorMessage = UIAlertController(title: "ERRO!", message: "Verifique os dados digitados e tente novamente", preferredStyle: .alert)
        
        errorMessage.addAction(okButton)
        
        self.present(errorMessage, animated: true, completion: nil)
    }
    //End of alerts area
    
}
