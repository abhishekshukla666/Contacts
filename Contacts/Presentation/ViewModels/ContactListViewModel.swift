//
//  ContactListViewModel.swift
//  Contacts
//
//  Created by Abhishek Shukla on 14/04/25.
//

import Foundation
class ContactListViewModel: ObservableObject {
    
    @Published var contacts: [Contact] = []
    
    private let contactListUseCase: ContactListUseCaseProtocol
    
    init(contactListUseCase: ContactListUseCaseProtocol) {
        self.contactListUseCase = contactListUseCase
        fetchContacts()
    }
    
    func fetchContacts() {
        self.contacts = contactListUseCase.fetchContacts()
    }
    
    func addContact(_ contact: Contact) {
        self.contacts.append(contact)
    }
    
    func deleteContact(_ contact: Contact) {
        guard let index = contacts.firstIndex(where: { $0.id == contact.id }) else { return }
        contacts.remove(at: index)
    }
    
    func updateContact(_ contact: Contact) {
        guard let index = contacts.firstIndex(where: { $0.id == contact.id }) else { return }
        contacts[index] = contact
    }
    
    func searchContacts(query: String) -> [Contact] {
        guard !query.isEmpty else {
            return contacts
        }
        return contactListUseCase.searchContacts(text: query)
    }
}
