//
//  ContactsTableViewCell.swift
//  AppListaContatos
//
//  Created by Squad Apps on 20/07/23.
//

import UIKit

class ContactsTableViewCell: UITableViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var pencilImageView: UIImageView!
    
    private var screenReference:UIViewController?
    private var contactList:[Contact] = []
    private var firstScreen:ContactListDelegate?
    private var contactID:Int = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    //MARK:Bind for tableView
    func bind (cell:Contact, reference: UIViewController, contactList:[Contact], firstScreen:ContactListDelegate) {
        
        self.nameLabel.text = cell.getName()
        self.phoneLabel.text = cell.getPhone()
        self.contactID = cell.getID()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(pencilSelected))
        pencilImageView.addGestureRecognizer(tap)
        
        self.screenReference = reference
        self.contactList = contactList
        self.firstScreen = firstScreen
    }
    
    //MARK: Func for trashIMG action
    @objc func pencilSelected() {
        //Primeira referencia
        guard let screenReference = self.screenReference, let firstScreen = firstScreen else { return }
        
        //Segunda referencia
        let editContactSB = UIStoryboard(name: "EditContact", bundle: nil)
        let editContactVC = editContactSB.instantiateViewController(withIdentifier: "EditContact") as! EditContactViewController
        editContactVC.initView(contactList: contactList, firstScreen: firstScreen, contactID: contactID)
        screenReference.navigationController?.pushViewController(editContactVC, animated: true)
    }
    
}
