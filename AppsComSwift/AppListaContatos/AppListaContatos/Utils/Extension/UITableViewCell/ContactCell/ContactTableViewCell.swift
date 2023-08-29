//
//  ContactTableViewCell.swift
//  AppListaContatos
//
//  Created by Squad Apps on 29/08/23.
//

import UIKit

class ContactTableViewCell: UITableViewCell {
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var pencilImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    
    private weak var delegate:EditContactDelegate?
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
    func bind (item:Contact, delegate:EditContactDelegate) {
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
