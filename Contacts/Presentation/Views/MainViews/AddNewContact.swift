//
//  AddNewContact.swift
//  Contacts
//
//  Created by Abhishek Shukla on 15/04/25.
//

import SwiftUI

struct AddNewContact: View {
    
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject private var viewModel: ContactListViewModel
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var email: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    TextField("First Name", text: $firstName)
                        .keyboardType(.alphabet)
                        .textContentType(.name)
                        .textInputAutocapitalization(.words)
                    TextField("Last Name", text: $lastName)
                        .keyboardType(.alphabet)
                        .textContentType(.name)
                    TextField("Email", text: $email)
                        .textContentType(.emailAddress)
                        .textInputAutocapitalization(.never)
                        .keyboardType(.emailAddress)
                }
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Button("Cancel") {
                            dismiss()
                        }
                    }
                    
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("Save") {
                            let newContact = Contact(id: UUID().uuidString, firstName: firstName, lastName: lastName, email: email)
                            viewModel.addContact(newContact)
                            dismiss()
                        }
                    }
                }                
            }
            .navigationTitle("Add New Contact")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    AddNewContact()
        .environmentObject(ContactListViewModel(contactListUseCase: ContactListUsecase(contactListRepository: ContactListRepository(contactListDataProvider: ContactListDataProvider()))))
}
