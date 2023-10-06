import Foundation
import UIKit

//https://stackoverflow.com/questions/24022479/how-would-i-create-a-uialertview-in-swift
class HelpController: UIViewController {
    
    //MARK: Setup Alert
    func setupAlert(title: String, message:String, completion: (() -> Void)? = nil) {
        let alert: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { _ in completion?() }))
        self.present(alert, animated: true, completion: nil)
    }
    
    //MARK: Setup TextFields Visual
    func setupTextFieldsVisual(nameTextField:UITextField, lastNameTextField:UITextField, phoneTextField:UITextField) {
        
        nameTextField.attributedPlaceholder = NSAttributedString(
                    string: "Name",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGray]
                )
        nameTextField.layer.borderColor = UIColor(named: "textFieldBorderColor")?.cgColor ?? UIColor.systemGray.cgColor
        nameTextField.layer.borderWidth = 1.0
        nameTextField.layer.cornerRadius = 5
        nameTextField.layer.masksToBounds = true
        
        /*-----------------*/

        lastNameTextField.attributedPlaceholder = NSAttributedString(
                    string: "Last Name",
                    attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGray]
                )
        lastNameTextField.layer.borderColor = UIColor(named: "textFieldBorderColor")?.cgColor ?? UIColor.systemGray.cgColor
        lastNameTextField.layer.borderWidth = 1.0
        lastNameTextField.layer.cornerRadius = 5
        lastNameTextField.layer.masksToBounds = true
        
        /*-----------------*/
        
        phoneTextField.attributedPlaceholder = NSAttributedString(
                    string: "Phone",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGray]
                )
        phoneTextField.layer.borderColor = UIColor(named: "textFieldBorderColor")?.cgColor ?? UIColor.systemGray.cgColor
        phoneTextField.layer.borderWidth = 1.0
        phoneTextField.layer.cornerRadius = 5
        phoneTextField.layer.masksToBounds = true
        phoneTextField.keyboardType = .phonePad
    }
    
    //MARK:Setup Visual TF validation
    func normalTextField(textField: UITextField, icon: UIImageView){
        textField.layer.borderColor = UIColor(named: "textFieldBorderColor")?.cgColor ?? UIColor.systemGray.cgColor
        icon.tintColor = UIColor(named: "adaptGreenColor")
    }
    
    func validTextField(textField: UITextField, icon: UIImageView) {
        textField.layer.borderColor = UIColor.systemGreen.cgColor
        icon.tintColor = UIColor(named: "adaptGreenColor")
    }
    
    func errorTextField(textField: UITextField, icon: UIImageView) {
        textField.layer.borderColor = UIColor.systemRed.cgColor
        icon.tintColor = UIColor.systemRed
    }
    
}

//MARK: Validate contact in Array
extension HelpController {
    
    func searchForContact(contactList: [Contact], phoneNumber: String) -> Bool {
        return contactList.contains{$0.getPhone() == phoneNumber}
    }
    
}
