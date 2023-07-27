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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func bind (cell:Contact) {
        //fazer verificação pra pegar o nome ou o lastName
        self.nameLabel.text = cell.getName()
    }
    
}
