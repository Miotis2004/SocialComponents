//
//  DynamicListView.swift
//  SocialComponents
//
//  Created by Ronald Joubert on 12/24/20.
//

import SwiftUI

struct DynamicListView: View {
    
    let users:[User] = [
        .init(username: "Meowser", message: "I love catnip."),
        .init(username: "Sir Meows-a-lot", message: "Honor is my life!"),
        .init(username: "Purrmeister", message: "Happiness is great!")
    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(users, id: \.id) { user in
                    HStack {
                        Image(systemName: "person.crop.circle")
                            .font(.system(size: 64, weight: .regular))
                            .foregroundColor(Color(.systemBlue))
//                        Spacer()
                        VStack(alignment: .leading) {
                            Text(user.username)
                                .font(.headline)
                            Text(user.message)
                                .font(.subheadline)
                        }
                        
                    }
                    
                }
            }.navigationBarTitle(Text("Dynamic List"))
        }
    }
}

struct DynamicListView_Previews: PreviewProvider {
    static var previews: some View {
        DynamicListView()
    }
}
