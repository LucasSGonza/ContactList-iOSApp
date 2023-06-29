//
//  Model.swift
//  testezin
//
//  Created by Squad Apps on 22/06/23.
//

import Foundation

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

//var contatoTeste:Contact = Contact("Lucas", 996396316)

