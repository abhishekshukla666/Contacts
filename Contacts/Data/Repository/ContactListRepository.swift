//
//  ContactListRepository.swift
//  Contacts
//
//  Created by Abhishek Shukla on 14/04/25.
//

import CoreData

//protocol ContactListRepositoryProtocol {
//    func fetchContacts() async throws -> [Contact]
//}
//
//class MockContactListRepository {
//    
//    let contactListDataProvider: ContactListDataProviderProtocol
//    let mockContactListDataProvider: MockContactListDataProviderProtocol
//    
//    init(contactListDataProvider: ContactListDataProviderProtocol, mockContactListDataProvider: MockContactListDataProviderProtocol = MockContactListDataProvider()) {
//        self.contactListDataProvider = contactListDataProvider
//        self.mockContactListDataProvider = mockContactListDataProvider
//    }
//}
//
//extension MockContactListRepository: ContactListRepositoryProtocol {
//    func fetchContacts() async throws -> [Contact] {
////        try await contactListDataProvider.fetchContacts()
//        mockContactListDataProvider.fetchContacts()
//    }
//}

protocol ContactListRepositoryProtocol {
    func fetchContacts() -> [Contact]
    func searchContacts(text: String) -> [Contact]
}

final class ContactListRepository: ContactListRepositoryProtocol {
    
    let contactListDataProvider: ContactListDataProviderProtocol
    
    init(contactListDataProvider: ContactListDataProviderProtocol) {
        self.contactListDataProvider = contactListDataProvider
    }
}

extension ContactListRepository {
    func fetchContacts() -> [Contact] {
        contactListDataProvider.fetchContacts()
    }
    
    func searchContacts(text: String) -> [Contact] {
        contactListDataProvider.searchContacts(text: text)
    }
}
