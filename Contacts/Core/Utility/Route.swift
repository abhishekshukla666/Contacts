//
//  Route.swift
//  Contacts
//
//  Created by Abhishek Shukla on 14/04/25.
//

import SwiftUI

enum Route {
    case contactDetails(contact: Contact)
}

extension Route: Hashable {
    
    static func ==(lhs: Route, rhs: Route) -> Bool {
        switch (lhs, rhs) {
        case (.contactDetails(let lhsContact), .contactDetails(let rhsContact)):
            return lhsContact.id == rhsContact.id
        }
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.hashValue)
    }
}

extension Route: View {
    var body: some View {
        switch self {   
        case .contactDetails(let contact):
            ContactDetailsView(contact: contact)
        }
    }
}
