//
//  Route.swift
//  Contacts
//
//  Created by Abhishek Shukla on 14/04/25.
//

import SwiftUI

enum Route: Hashable {
    case contactDetails(contact: Contact)
}

extension Route: View {
    var body: some View {
        switch self {   
        case .contactDetails(let contact):
            ContactDetailsView(contact: contact)
        }
    }
}
