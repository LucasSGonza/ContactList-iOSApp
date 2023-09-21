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
    
    func isNameValid() -> Bool {
        let regex = "^[a-zA-Z_ ]*$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        
        return predicate.evaluate(with: self)
    }
    
    func isPhoneValid() -> Bool {
        let regex = "^[0-9]+$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        
        return predicate.evaluate(with: self)
    }
    
}
