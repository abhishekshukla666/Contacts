//
//  ContactRow.swift
//  Contacts
//
//  Created by Abhishek Shukla on 14/04/25.
//

import SwiftUI

struct ContactRow: View {
    var contact: Contact
    
    var body: some View {
        HStack {
            Text(contact.initials)
                .font(.headline)
                .fontWeight(.bold)
                .padding(20)
                .background {
                    Circle()
                        .foregroundStyle(.tertiary)
                }
            
            VStack(alignment: .leading) {
                Text(contact.firstName + " " + contact.lastName)
                    .font(.headline)
                Text(contact.email)
                    .foregroundColor(.secondary)
            }
            
//            Spacer()
//            Image(systemName: "chevron.right")
//                .foregroundColor(.secondary)
        }
    }
}


#Preview {
    ContactRow(contact: .init(id: UUID().uuidString, firstName: "Abhishek", lastName: "Shukla", email: "abhishek@example.com"))
}
