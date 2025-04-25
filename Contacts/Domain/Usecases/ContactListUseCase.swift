//
//  ContactListUseCase.swift
//  Contacts
//
//  Created by Abhishek Shukla on 14/04/25.
//

import Foundation

protocol ContactListUseCaseProtocol {
    func fetchContacts() -> [Contact]
    func searchContacts(text: String) -> [Contact]
}

final class ContactListUsecase: ContactListUseCaseProtocol {
    let contactListRepository: ContactListRepositoryProtocol
    
    init(contactListRepository: ContactListRepositoryProtocol) {
        self.contactListRepository = contactListRepository
    }
}

extension ContactListUsecase {
    func fetchContacts() -> [Contact] {
        return contactListRepository.fetchContacts()
    }
    
    func searchContacts(text: String) -> [Contact] {
        return contactListRepository.searchContacts(text: text)
    }
}
