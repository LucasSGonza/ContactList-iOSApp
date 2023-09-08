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
    @IBOutlet weak var favoriteImageView: UIImageView!
    
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
        
        //verifica se existe nome, se sim, ele é exibido. Se n, exibe o sobrenome (ao menos um dos 2 deve existir --> verificação ocorre no momento da criação de um novo contato, bem como na edição do mesmo) 
        self.nameLabel.text = item.getName().isEmpty ? item.getLastName() : item.getName()
        self.phoneLabel.text = item.getPhone()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(pencilSelected))
        pencilImageView.addGestureRecognizer(tap)
    }
    
    //MARK: go to EditContact
    @objc func pencilSelected() {
        guard let contact = contact else { return }
        delegate?.goToEditContact(contact)
    }
    
    //MARK: Favorite func
    @objc func favoriteSelected() {
        guard let contact = contact else { return }
        
        if contact.isFavorite {
            contact.isFavorite = false
            favoriteImageView.image = UIImage(systemName: "star")
            favoriteImageView.isHidden = true
            favoriteImageView.isUserInteractionEnabled = true
        } else {
            contact.isFavorite = true
            favoriteImageView.image = UIImage(systemName: "star.fill")
            favoriteImageView.isHidden = false
            favoriteImageView.isUserInteractionEnabled = false
        }
    }
    
}
