//
//  AdditionalFunctionalites.swift
//  testezin
//
//  Created by Squad Apps on 11/07/23.
//

import Foundation
import UIKit

//MARK: Validações dos Inputs

/*links:
https://stackoverflow.com/questions/13814340/i-need-a-regular-expression-that-only-accepts-text-characters-with-spaces-allowe
 
https://www.advancedswift.com/regular-expressions/#username-regular-expression
 */

class HelpController: UIViewController {
    func setupAlert(title: String, message:String) {
        let alert: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true, completion: nil)
    }
    
    func validateInputs(_ InputName: String , _ InputNumber: String) -> Bool {
        //let phonePattern = #"^\(?\d{2}\)?[ -]?\d{5}[ -]?\d{4}$"# //verifica o numero completo de telefone
        let numberRgx = "^[0-9]*$" //verifica se ppossui numeros de 0-9
        let usernamePattern = "^[a-zA-Z ]*$"
        
        let resultName = InputName.range(of: usernamePattern, options: .regularExpression)
        let resultPhone = InputNumber.range(of: numberRgx, options: .regularExpression)
        
        //se a validação der certo, retorna != nil --> em name deve dar errado, pois estou validando se o campo possuí números de 0-9
        if resultName != nil && resultPhone != nil {
            return true
        } else {
            return false
        }
    }
}
