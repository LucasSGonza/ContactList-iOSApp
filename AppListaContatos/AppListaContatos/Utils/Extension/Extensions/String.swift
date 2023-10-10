//
//  String.swift
//  AppListaContatos
//
//  Created by Squad Apps on 21/09/23.
//

import Foundation

extension String {
    
    func isPhoneValid() -> Bool {
//        let regex = "^([1-9]{2})+(?:[2-8]|9[0-9])+[0-9]{3}+[0-9]{4}+$"
        let regex = "^[1-9]\\d{2,14}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)

        return predicate.evaluate(with: self)
    }
    
}
