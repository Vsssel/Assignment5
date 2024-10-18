//
//  SingleContactViewController.swift
//  ContactListApp
//
//  Created by Assel Artykbay on 18.10.2024.
//

import UIKit

class SingleContactViewController: UIViewController{
    var contact: Contact?
    
    @IBOutlet weak var name: UITextField!
    
    @IBOutlet weak var phone: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        name.text = contact?.name
        phone.text = contact?.phone
 
        name.isUserInteractionEnabled = false
        phone.isUserInteractionEnabled = false
        
    
        name.backgroundColor = .clear
        phone.backgroundColor = .clear
    }

    @IBAction func doneAction(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
