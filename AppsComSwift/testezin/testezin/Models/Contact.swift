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
    var phone:String
    
    init(_ name:String,_ number:String) {
        self.name = name
        self.phone = number
    }
    
    func showInfos() -> String {
        return "Name: \(self.name), Number: \(self.phone)"
    }
    
    func validateIfContactAlreadyExist(_ contactList: [Contact]) -> Bool {
        var result:Bool = false //to set my bool return of the func
        
        contactList.forEach { contato in
            if ((self.name == contato.name) && (self.phone == contato.phone) ) {
                result = true
                return
            }
        }
        return result
    }
    
}
