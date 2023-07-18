//
//  Protocol.swift
//  testezin
//
//  Created by Squad Apps on 29/06/23.
//

import Foundation

//PT-BR => protocol para que as Views utilizem do método getContactList para trocarem entre si a contactList, contendo seu conteudo sempre atualizado
//EN => protocol to allow to pass data between the viewController's
protocol toPassDataDelegate: AnyObject {
    func setContactList(_ list:[Contact]) //the secret is here => this func will receive the contactList in the parameter and will set/equal with his own contactList
    func showContactInfos() -> String
}
