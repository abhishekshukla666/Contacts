//
//  ContactsApp.swift
//  Contacts
//
//  Created by Abhishek Shukla on 14/04/25.
//

import SwiftUI
import SwiftData

@main
struct ContactsApp: App {
    
    @StateObject var viewModel = ContactListViewModel(contactListUseCase: ContactListUsecase(contactListRepository: ContactListRepository(contactListDataProvider: ContactListDataProvider())))
    
    @StateObject private var routerManager = NavigationRouter()
    
    var body: some Scene {
        WindowGroup {
            ContactListView()
                .environmentObject(viewModel)
                .environmentObject(routerManager)
        }
    }
}
