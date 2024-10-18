//
//  ContactDelegate.swift
//  ContactListApp
//
//  Created by Assel Artykbay on 18.10.2024.
//

import Foundation

protocol ContactDelegate: AnyObject {
    func addNewContact(_ contact: Contact)
}

