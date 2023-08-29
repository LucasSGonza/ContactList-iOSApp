import Foundation
import UIKit

class HelpController: UIViewController {
    
    func setupAlert(title: String, message:String, completion: (() -> Void)? = nil) {
        let alert: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { _ in completion?() }))
        self.present(alert, animated: true, completion: nil)
    }
    
    // para usar antes de deletar um contato
    func setupAlertDialog(title: String, message:String) {
    }
    
}
