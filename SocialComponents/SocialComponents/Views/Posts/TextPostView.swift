//
//  TextPostView.swift
//  SocialComponents
//
//  Created by Ronald Joubert on 12/29/20.
//

import SwiftUI

struct TextPostView: View {
    
    @State private var numLikes: Int = 0
    @State private var liked: Bool = false
    
    let user = User(username: "Bob Smith", message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "person.circle")
                    .resizable()
                    .frame(width: 50, height: 50)
                Text(user.username)
                    .font(.title)
                    .bold()
                
                Spacer()
            }
            .padding()
            Divider()
            Text(user.message)
            Divider()
            HStack {
                Button(action: {
                    liked.toggle()
                    if liked {
                        numLikes += 1
                    } else {
                        numLikes -= 1
                    }
                }, label: {
                    
                    if !liked {
                        Image(systemName: "hand.thumbsup")
                            .font(.system(size: 16, weight: .regular))
                            .padding()
                    } else {
                        Image(systemName: "hand.thumbsup.fill")
                            .font(.system(size: 16, weight: .regular))
                            .padding()
                    }
                })
                Spacer()
                Text("Likes: \(numLikes)")
                    .padding()
            }
        }
        .frame(width: 350)
        .cornerRadius(20)
        .overlay(RoundedRectangle(cornerRadius: 20)
                    .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.1), lineWidth: 3)
        )
        .padding([.top, .horizontal])
    }
}

struct TextPostView_Previews: PreviewProvider {
    static var previews: some View {
        TextPostView()
    }
}
