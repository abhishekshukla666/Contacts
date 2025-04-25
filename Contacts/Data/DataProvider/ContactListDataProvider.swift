//
//  ContactListDataProvider.swift
//  Contacts
//
//  Created by Abhishek Shukla on 14/04/25.
//

import SwiftUI
import SwiftData

protocol ContactListDataProviderProtocol {
    func fetchContacts() -> [Contact]
    func searchContacts(text: String) -> [Contact]
}

final class ContactListDataProvider: ContactListDataProviderProtocol {
    
    @Query private var contacts: [Contact] = []
    
    /*
    func fetchContacts() -> [Contact] {
        return [
            .init(id: "1", firstName: "Abhishek", lastName: "Shukla", email: "abhishek@example.com"),
//            .init(id: "2", firstName: "Akshay", lastName: "Singh", email: "akshay@example.com"),
//            .init(id: "3", firstName: "Rohit", lastName: "Verma", email: "rohit@example.com"),
//            .init(id: "4", firstName: "Shubham", lastName: "Gupta", email: "shubham@example.com"),
//            .init(id: "5", firstName: "Prateek", lastName: "Jha", email: "prateek@example.com"),
//            .init(id: "6", firstName: "Vishal", lastName: "Singh", email: "vishal@example.com"),
//            .init(id: "7", firstName: "Ankit", lastName: "Sharma", email: "ankit@example.com"),
//            .init(id: "8", firstName: "Harsh", lastName: "Singh", email: "harsh@example.com"),
//            .init(id: "9", firstName: "Jatin", lastName: "Gupta", email: "jatin@example.com"),
            .init(id: "10", firstName: "Sagar", lastName: "Singh", email: "sagar@example.com")
        ]
    }
     */
    
    func fetchContacts() -> [Contact] {
        contacts
    }
    
    func searchContacts(text: String) -> [Contact] {
        return fetchContacts().filter {
            $0.firstName.localizedStandardContains(text) ||
            $0.lastName.localizedStandardContains(text) ||
            $0.email.localizedStandardContains(text)
        }
    }
}
