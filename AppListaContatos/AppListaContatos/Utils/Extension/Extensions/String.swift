//
//  String.swift
//  AppListaContatos
//
//  Created by Squad Apps on 21/09/23.
//

import Foundation

/*OBS: Need to update the regex to better inputs performance
 1- Limit of characters
 2- Valid spaces, but only one (ex: Lucas Silva)
 */

extension String {
    
//    func isNameValid() -> Bool {
//        let regex = "^[a-zA-Z]+( [a-zA-Z-0-9]+)*$"
//        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
//
//        return predicate.evaluate(with: self)
//    }
    
    func isPhoneValid() -> Bool {
        let regex = "^([1-9]{2})+(?:[2-8]|9[0-9])+[0-9]{3}+[0-9]{4}+$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)

        return predicate.evaluate(with: self)
    }
    
}
