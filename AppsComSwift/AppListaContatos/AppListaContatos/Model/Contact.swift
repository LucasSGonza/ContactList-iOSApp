//
//  Contact.swift
//  AppListaContatos
//
//  Created by Squad Apps on 20/07/23.
//

import Foundation

class Contact {
    
    private var name:String
    private var phone:String
    
    init(name:String,phone:String) {
        self.name = name
        self.phone = phone
    }
    
    //Get/Set
    func getName() -> String {
        return name
    }
    func setName(_ name:String) {
        self.name = name
    }
    
    func getPhone() -> String {
        return phone
    }
    func setPhone(_ phone:String) {
        self.phone = phone
    }
    
}
