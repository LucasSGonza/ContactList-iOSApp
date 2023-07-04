//
//  Model.swift
//  testezin
//
//  Created by Squad Apps on 22/06/23.
//

import Foundation

//MARK: Class Contact
class Contact {
    
    var name:String
    var number:Int
    
    init(_ name:String,_ number:Int) {
        self.name = name
        self.number = number
    }
    
    func showInfos() -> String {
        return "Name: \(name), Number: \(number)"
    }
    
}

//MARK: Validações dos Inputs
func validateInputs(_ InputName: String , _ InputNumber: String) -> Bool {
    
    //let phonePattern = #"^\(?\d{2}\)?[ -]?\d{5}[ -]?\d{4}$"# //verifica o numero completo de telefone
    let numberRgx = "^[0-9]*$" //verifica se ppossui numeros de 0-9
    
    let resultName = InputName.range(of: numberRgx, options: .regularExpression)
    let resultPhone = InputNumber.range(of: numberRgx, options: .regularExpression)
    
    //se a validação der certo, retorna != nil --> em name deve dar errado, pois estou validando se o campo possuí números de 0-9
    if resultName == nil && resultPhone != nil {
        return true
    } else {
        return false
    }
    
}
