//
//  Contact.swift
//  AppListaContatos
//
//  Created by Squad Apps on 20/07/23.
//

import Foundation

class Contact {

    private var id:Int = 0
    private var name:String = ""
    private var lastName:String = ""
    private var phone:String = ""
    public var isFavorite:Bool = false
    
    //init padrão
    init(name:String, lastName:String, phone:String, favorite:Bool) {
        self.name = name
        self.lastName = lastName
        self.phone = phone
        self.isFavorite = favorite
    }
    
    init() {
    }
    
    func showInfos() -> String {
        return
    """
    Name: \(name)
    LastName: \(lastName)
    Phone: \(phone)
    ID: \(id)
    Favoritado: \(isFavorite)
    """
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
    
    func getID() -> Int {
        return id
    }
    func setID(_ id:Int) {
        self.id = id
    }
    
}
