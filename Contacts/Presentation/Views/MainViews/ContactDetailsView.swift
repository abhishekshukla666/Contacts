//
//  ContactDetailsView.swift
//  Contacts
//
//  Created by Abhishek Shukla on 14/04/25.
//

import SwiftUI

struct ContactDetailsView: View {
    
    @EnvironmentObject var routeManager: NavigationRouter
    @EnvironmentObject private var viewModel: ContactListViewModel
    @State private var contact: Contact
    @State private var contactDidChange: Bool = false
    @State private var showDeleteConfirmation: Bool = false
    @State private var isEditing: Bool = false
    
    private let originalContact: Contact
    
    init(contact: Contact) {
        _contact = .init(initialValue: contact)
        self.originalContact = contact
    }
    
    
    var body: some View {
        VStack {
            Form {
                TextField("First Name", text: $contact.firstName)
                TextField("Last Name", text: $contact.lastName)
                TextField("Email", text: $contact.email)
                    .keyboardType(.emailAddress)
                    .textInputAutocapitalization(.never)
                    .textContentType(.emailAddress)
            }
            
            Button("Delete") {
                showDeleteConfirmation = true
            }
        }
        .onChange(of: contact, { oldValue, newValue in
            contactDidChange = newValue != originalContact
        })
        .alert("Unsaved Changes", isPresented: $isEditing, actions: {
            Button("Stay", role: .cancel){}
            Button("Discard Changes", role: .destructive) {
                dismiss()
            }
        }, message: {
            Text("Discard all these chnage before leaving the screen?")
        })
        .alert("Confirm Delete", isPresented: $showDeleteConfirmation, actions: {
            Button("Cancel", role: .cancel){}
            Button("Delete", role: .destructive) {
                deleteContact()
            }
        }, message: {
            Text("Are you sure you want to delete this contact?")
        })
        .navigationTitle("Edit Contact")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button("Cancel") {
                    showCancel()
                }
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                Button("Save") {
                    saveContact()
                }
                .disabled(!contactDidChange)
                .opacity(contactDidChange ? 1 : 0)
                .font(.headline)
            }
            
        }
    }
}

private extension ContactDetailsView {
    func saveContact() {
        let newContact = Contact(id: contact.id, firstName: contact.firstName, lastName: contact.lastName, email: contact.email)
        viewModel.updateContact(newContact)
        dismiss()
    }
    
    func deleteContact() {
        viewModel.deleteContact(contact)
        dismiss()
    }
    
    func showCancel() {
        if contactDidChange {
            isEditing = true
        } else {
            dismiss()
        }
    }
    
    func dismiss() {
        routeManager.pop()
    }
}


#Preview {
    ContactDetailsView(contact: .init(id: UUID().uuidString, firstName: "Abhishek", lastName: "Shukla", email: "abhishek@example.com"))
}
