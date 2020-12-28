//
//  LoginView.swift
//  SocialComponents
//
//  Created by Ronald Joubert on 12/27/20.
//

import SwiftUI
import FirebaseAuth

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
    @State private var showAlert: Bool = false
    
    @Binding var isLoggedIn: Bool
    
    var body: some View {
        VStack {
            Spacer()
            TextField("Email", text: $email)
                .padding()
            Divider()
            TextField("Password", text: $password)
                .padding()
            Button (action: {
                Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                    if error != nil {
                        self.showAlert = true
                    } else {
                        isLoggedIn = true
                    }
                    
                }
            }, label: {
                Text("Login")
            })
            .alert(isPresented: $showAlert, content: {
                Alert(title: Text("Login Error"), message: Text("Something went wrong, try again"), dismissButton: .default(Text("OK")))
            })
            Spacer()
        }
    }
}


