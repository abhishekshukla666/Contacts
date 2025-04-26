//
//  ContactListView.swift
//  Contacts
//
//  Created by Abhishek Shukla on 14/04/25.
//

import SwiftUI

struct ContactListView: View {
    
    @EnvironmentObject var routeManager: NavigationRouter
    @EnvironmentObject var viewModel: ContactListViewModel

    @State private var showAddContactSheet: Bool = false
    @State private var searchText: String = ""
    
    var searchResults: [Contact] {
        viewModel.searchContacts(query: searchText)
    }
    
    var body: some View {
        NavigationStack(path: $routeManager.routes) {
            List {
                ForEach(searchResults) { contact in
                        ContactRow(contact: contact)
                            .swipeActions {
                                Button {
                                    withAnimation {
                                        viewModel.deleteContact(contact)
                                    }
                                } label: {
                                    Image(systemName: "trash")
                                }
                                .tint(.red)
                                
                                Button {
                                    withAnimation {
                                        routeManager.navigate(to: .contactDetails(contact: contact))
                                    }
                                } label: {
                                    Image(systemName: "square.and.pencil.circle.fill")
                                }
                                .tint(.blue)
                            }
                            .onTapGesture {
                                routeManager.navigate(to: Route.contactDetails(contact: contact))
                            }
                    }
            }
            .navigationTitle(Text("Contacts"))
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showAddContactSheet = true
                    } label: {
                        Image(systemName: "plus")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .font(.system(size: 20, weight: .bold))
                        
                            .foregroundStyle(.blue)
                    }
                }
            }
            .navigationDestination(for: Route.self) { route in
                switch route {
                case .contactDetails(let contact):
                    ContactDetailsView(contact: contact)
                }
            }
        }
        .searchable(text: $searchText, prompt: "Search")
        .sheet(isPresented: $showAddContactSheet) {
            AddNewContact()
                .presentationDetents([.medium])
//                .presentationDragIndicator(.visible)
        }
    }
}


#Preview("Light Mode") {
    ContactListView()
        .environmentObject(ContactListViewModel(contactListUseCase: ContactListUsecase(contactListRepository: ContactListRepository(contactListDataProvider: ContactListDataProvider()))))
        .environmentObject(NavigationRouter())
        .preferredColorScheme(.light)
}

#Preview("Dark Mode") {
    ContactListView()
        .environmentObject(ContactListViewModel(contactListUseCase: ContactListUsecase(contactListRepository: ContactListRepository(contactListDataProvider: ContactListDataProvider()))))
        .environmentObject(NavigationRouter())
        .preferredColorScheme(.dark)
}

