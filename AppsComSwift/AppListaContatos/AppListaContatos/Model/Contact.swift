//
//  Contact.swift
//  AppListaContatos
//
//  Created by Squad Apps on 20/07/23.
//

import Foundation

class Contact {
    
    private var name:String = ""
    private var lastName:String = ""
    private var phone:String = ""
    
    //init padrão
    init(name:String, lastName:String, phone:String) {
        self.name = name
        self.lastName = lastName
        self.phone = phone
    }
    
    init() {
    }
    
    func showInfos() -> String {
        return "Name: \(name)\nLastName: \(lastName)\nPhone: \(phone)"
    }
    
    //Get/Set
    func getName() -> String {
        return name
    }
    func setName(_ name:String) {
        self.name = name
    }
    
    func getLastName() -> String {
        return lastName
    }
    func setLastName(_ lastName:String) {
        self.lastName = lastName
    }
    
    func getPhone() -> String {
        return phone
    }
    func setPhone(_ phone:String) {
        self.phone = phone
    }
    
}
