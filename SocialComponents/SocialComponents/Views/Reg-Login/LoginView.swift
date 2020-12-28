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
        ZStack {
            Color.blue
            VStack {
                Spacer()
                HStack {
                    Image(systemName: "person.circle")
                        .resizable()
                        .frame(width: 50, height: 50)
                    TextField("Email", text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                }
                Divider()
                HStack {
                    Image(systemName: "lock.circle")
                        .resizable()
                        .frame(width: 50, height: 50)
                    TextField("Password", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                }
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
                        .foregroundColor(Color.black)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 30)
                        .background(Color.white)
                        .clipShape(Capsule())
                })
                .alert(isPresented: $showAlert, content: {
                    Alert(title: Text("Login Error"), message: Text("Something went wrong, try again"), dismissButton: .default(Text("OK")))
                })
                Button (action: {
                    RegisterView()
                }, label: {
                    Text("Register new account")
                        .foregroundColor(Color.black)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 30)
                        .background(Color.white)
                        .clipShape(Capsule())
                })
                Spacer()
            }
        }
    }
}


