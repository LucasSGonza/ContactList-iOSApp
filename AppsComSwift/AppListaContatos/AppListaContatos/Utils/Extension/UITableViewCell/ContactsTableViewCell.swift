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
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var trashImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    //MARK:Bind for tableView
    func bind (cell:Contact) {
        //fazer verificação pra pegar o nome ou o lastName
        self.nameLabel.text = cell.getName()
        self.lastNameLabel.text = cell.getLastName()
        self.phoneLabel.text = cell.getPhone()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(trashSelect))
        trashImageView.addGestureRecognizer(tap)
        
    }
    
    //MARK: Func for trashIMG action
    @objc func trashSelect() {
        print("ta funfando")
    }
    
}
