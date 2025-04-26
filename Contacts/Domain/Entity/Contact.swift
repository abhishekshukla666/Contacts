//
//  Contact.swift
//  Contacts
//
//  Created by Abhishek Shukla on 14/04/25.
//

import Foundation

struct Contact: Identifiable, Hashable {
    var id: String
    var firstName: String
    var lastName: String
    var email: String
    
    init(id: String, firstName: String, lastName: String, email: String) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
    }
    
    var initials: String {
        let first = firstName.first?.uppercased() ?? ""
        let last = lastName.first?.uppercased() ?? ""
        return String(first + last)
    }
}
