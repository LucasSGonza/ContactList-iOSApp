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
    
    private weak var delegate:EditContactListener?
    private var contact:Contact?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    //MARK:Bind for tableView
    func bind (item:Contact, delegate:EditContactListener) {
        self.delegate = delegate
        self.contact = item
        self.nameLabel.text = item.getName()
        self.phoneLabel.text = item.getPhone()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(pencilSelected))
        pencilImageView.addGestureRecognizer(tap)
    }
    
    //MARK: Func for trashIMG action
    @objc func pencilSelected() {
        guard let contact = contact else { return }
        delegate?.goToEditContact(contact)
    }
    
}
