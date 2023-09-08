import Foundation
import UIKit

class HelpController: UIViewController {
    
    func setupAlert(title: String, message:String, completion: (() -> Void)? = nil) {
        let alert: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { _ in completion?() }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func setupTextFields(nameTextField:UITextField, lastNameTextField:UITextField, phoneTextField:UITextField) {
        
        nameTextField.attributedPlaceholder = NSAttributedString(
                    string: "Name",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGray]
                )
        nameTextField.layer.borderColor = UIColor(named: "textFieldColor")?.cgColor ?? UIColor.systemGray.cgColor
        nameTextField.layer.borderWidth = 1.0
        nameTextField.layer.cornerRadius = 10
        nameTextField.layer.masksToBounds = true
        
        lastNameTextField.attributedPlaceholder = NSAttributedString(
                    string: "Last Name",
                    attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGray]
                )
        lastNameTextField.layer.borderColor = UIColor(named: "textFieldColor")?.cgColor ?? UIColor.systemGray.cgColor
        lastNameTextField.layer.borderWidth = 1.0
        lastNameTextField.layer.cornerRadius = 10
        lastNameTextField.layer.masksToBounds = true
        
        phoneTextField.attributedPlaceholder = NSAttributedString(
                    string: "Phone",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGray]
                )
        phoneTextField.layer.borderColor = UIColor(named: "textFieldColor")?.cgColor ?? UIColor.systemGray.cgColor
        phoneTextField.layer.borderWidth = 1.0
        phoneTextField.layer.cornerRadius = 10
        phoneTextField.layer.masksToBounds = true
    }
    
}
