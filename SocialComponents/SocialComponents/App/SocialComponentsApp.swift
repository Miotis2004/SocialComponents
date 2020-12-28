//
//  SocialComponentsApp.swift
//  SocialComponents
//
//  Created by Ronald Joubert on 12/24/20.
//

import SwiftUI
import Firebase

@main
struct SocialComponentsApp: App {
    
    @State var isLoggedIn: Bool = false
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            if !isLoggedIn {
                LoginView(isLoggedIn: $isLoggedIn)
            } else {
                ContentView()
            }
            
        }
    }
}
