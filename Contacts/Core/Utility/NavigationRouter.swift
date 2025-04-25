//
//  NavigationRouter.swift
//  Contacts
//
//  Created by Abhishek Shukla on 14/04/25.
//

import Foundation

final class NavigationRouter: ObservableObject {
    
    @Published var routes: [Route] = .init()
    
    func navigate(to screen: Route) {
        routes.append(screen)
    }
    
    func pop() {
        guard !routes.isEmpty else { return }
        routes.removeLast()
    }
    
    func reset() {
        routes.removeAll()
    }
}
