//
//  MainViewController.swift
//  AppListaContatos
//
//  Created by Squad Apps on 20/07/23.
//

import UIKit

class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
    }
    
    
    private func setupNavigationBar(){
        self.navigationController?.navigationBar.barTintColor = .black
        self.navigationItem.title = "Contato"
        self.navigationItem.titleView?.tintColor = .white
    }
    
    
    @IBAction func goToContactList(_ sender: UIButton) {
        
        let contactListStoryboard:UIStoryboard = UIStoryboard(name: "ContactList", bundle: nil)
        
        let contactListScreen = contactListStoryboard.instantiateViewController(withIdentifier: "ContactList") as! ContactListViewController
        
        //contactListScreen.modalPresentationStyle = .fullScreen
        
        navigationController?.pushViewController(contactListScreen, animated: true)
        //navigationController?.show(contactListScreen, sender: <#T##Any?#>)
        
        //self.present(contactListScreen, animated: true)
    }
    
}
