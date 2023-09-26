//
//  FloatingLabelInput.swift
//  AppListaContatos
//
//  Created by Squad Apps on 26/09/23.
//

import Foundation
import UIKit

class FloatingLabelInput: UITextField {
    
    var floatingLabel: UILabel = UILabel(frame: CGRect.zero) // Label
    var floatingLabelHeight: CGFloat = 16 // Default height
    
    @IBInspectable
    var _placeholder: String? // we cannot override 'placeholder'
    
    @IBInspectable
    var floatingLabelColor: UIColor = UIColor.systemGray {
        didSet {
            self.floatingLabel.textColor = floatingLabelColor
            self.setNeedsDisplay()
        }
    }
    
    @IBInspectable
    var floatingLabelFont: UIFont = UIFont.systemFont(ofSize: 15) {
        didSet {
            self.floatingLabel.font = self.floatingLabelFont
            self.font = self.floatingLabelFont
            self.setNeedsDisplay()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        self._placeholder = (self._placeholder != nil) ? self._placeholder : placeholder // Use our custom placeholder if none is set
        placeholder = self._placeholder // make sure the placeholder is shown
        self.floatingLabel = UILabel(frame: CGRect.zero)
        self.addTarget(self, action: #selector(self.addFloatingLabel), for: .editingDidBegin)
        self.addTarget(self, action: #selector(self.removeFloatingLabel), for: .editingDidEnd)
    }
    
    // Add a floating label to the view on becoming first responder
    @objc func addFloatingLabel() {
        if self.text == "" {
            self.floatingLabel.textColor = floatingLabelColor
            self.floatingLabel.font = floatingLabelFont
            self.floatingLabel.text = self._placeholder
            self.floatingLabel.layer.backgroundColor = UIColor(named: "backgroundColor")?.cgColor ?? UIColor.systemBackground.cgColor
            self.floatingLabel.translatesAutoresizingMaskIntoConstraints = false
            self.floatingLabel.clipsToBounds = true
            
            self.floatingLabel.frame = CGRect(x: 0, y: 0, width: floatingLabel.frame.size.width+4, height: self.floatingLabelHeight)
            
            self.floatingLabel.textAlignment = .center
            self.addSubview(self.floatingLabel)
          
            self.floatingLabel.bottomAnchor.constraint(equalTo:
            self.topAnchor, constant: -10).isActive = true // Place our label 10pts above the text field
            // Remove the placeholder
            self.placeholder = ""
        }
        self.bringSubviewToFront(subviews.last!)
        self.setNeedsDisplay()
    }
    
    @objc func removeFloatingLabel() {
        if self.text == "" {
            
            UIView.animate(withDuration: 1.0, delay: 0.10, usingSpringWithDamping: 0.3, initialSpringVelocity: 1, options: UIView.AnimationOptions.curveEaseInOut, animations: ({
                self.subviews.forEach{ $0.removeFromSuperview() }
                self.setNeedsDisplay()
            }), completion: nil)
            
//            UIView.animate(withDuration: 0.20) {
//               self.subviews.forEach{ $0.removeFromSuperview() }
//               self.setNeedsDisplay()
//            }
            self.placeholder = self._placeholder
        }
    }
    
}
