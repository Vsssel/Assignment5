//
//  AddContactViewController.swift
//  ContactListApp
//
//  Created by Assel Artykbay on 18.10.2024.
//

import UIKit

class AddContactViewController: UIViewController {
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var phoneField: UITextField!
    
    weak var delegate: ContactDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func saveContact(_ sender: UIButton) {
        guard let name = nameField.text, !name.isEmpty else {
            showAlert("Name is empty", "Name is a required field")
            return
        }
        
        guard let phone = phoneField.text, !phone.isEmpty else {
            showAlert("Phone is empty", "Phone is a required field")
            return
        }
        
        let newContact = Contact(name: name, phone: phone)
        
        delegate?.addNewContact(newContact)
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancel(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    func showAlert(_ title: String, _ message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
            print("OK button tapped")
        }
   
        alert.addAction(okAction)

        present(alert, animated: true, completion: nil)
    }

}
