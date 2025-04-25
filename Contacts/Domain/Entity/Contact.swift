//
//  Contact.swift
//  Contacts
//
//  Created by Abhishek Shukla on 14/04/25.
//

import SwiftData

@Model
final class Contact: Identifiable, Hashable {
    static func == (lhs: Contact, rhs: Contact) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
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
