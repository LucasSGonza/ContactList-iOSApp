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
    
    //EN => method is used in 'ContactViewController' in 'editContactList' button action
    func updateContact(_ name:String, _ phone:String){
        self.name = name
        self.phone = phone
    }
    
    func showInfos() -> String {
        return "Name: \(name), Number: \(phone)"
    }
    
}
