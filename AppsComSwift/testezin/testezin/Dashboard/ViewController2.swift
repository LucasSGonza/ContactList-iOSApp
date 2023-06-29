//
//  ViewController2.swift
//  testezin
//
//  Created by Squad Apps on 27/06/23.
//

import UIKit

class ViewController2: UIViewController {

    @IBOutlet weak var tabelaView: UITableView!
    
    
    //Delegate -> 'objeto' que será do tipo do protocol, para poder utilizar de seus métodos e atributos
    private var delegate: toPassDataDelegate?
    
    //Array que será cópia do meu bd na 1 ViewController
    private var contactList:[Contact] = []
    
    
    //func
    func initView(_ list:[Contact], delegate2:toPassDataDelegate){
        self.contactList = list
        self.delegate = delegate2
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate?.getContactList(contactList)
        print(delegate?.showContactInfos())
    }
    
    
    //func do botão para retornar para 1 ViewController
    @IBAction func goBack(_ sender: Any) {
        guard let delegate = delegate else {return}
        delegate.getContactList(contactList)
        navigationController?.popViewController(animated: true)
        dismiss(animated: true)
    }
    
    
    /*
    func updateTabelaView() {
        tabelaView.insertRows(at: )
    }
    */

}
