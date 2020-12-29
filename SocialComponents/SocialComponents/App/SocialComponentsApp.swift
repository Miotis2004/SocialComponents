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
    @State var isRegistered: Bool = true
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            if !isLoggedIn {
                VStack {
                    if isRegistered {
                        LoginView(isLoggedIn: $isLoggedIn, isRegistered: $isRegistered)
                    } else {
                        RegisterView(isLoggedIn: $isLoggedIn, isRegistered: $isRegistered)
                    }
                }
            } else {
                ContentView()
            }
            
        }
    }
}
