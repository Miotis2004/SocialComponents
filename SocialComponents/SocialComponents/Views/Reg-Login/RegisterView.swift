//
//  RegisterView.swift
//  SocialComponents
//
//  Created by Ronald Joubert on 12/27/20.
//

import SwiftUI
import FirebaseAuth

struct RegisterView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var verifyPassword: String = ""
    
    @Binding var isLoggedIn: Bool
    @Binding var isRegistered: Bool
    
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
                
                Divider()
                HStack {
                    Image(systemName: "lock.circle")
                        .resizable()
                        .frame(width: 50, height: 50)
                    TextField("Verify Password", text: $verifyPassword)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                }
                Button (action: {
                    Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                        if error != nil {
                            isRegistered = false
                            return
                        }
                        
                        isRegistered = true
                    }
                }, label: {
                    Text("Register")
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

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView(isLoggedIn: .constant(false), isRegistered: .constant(false))
    }
}
