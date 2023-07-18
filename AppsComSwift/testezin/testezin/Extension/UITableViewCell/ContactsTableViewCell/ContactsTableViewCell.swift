//
//  ContactsTableViewCell.swift
//  testezin
//
//  Created by Squad Apps on 06/07/23.
//

import UIKit

class ContactsTableViewCell: UITableViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func bind (item: Contact) {
        self.nameLabel.text = item.name
        self.numberLabel.text = item.phone
    }
    
}
