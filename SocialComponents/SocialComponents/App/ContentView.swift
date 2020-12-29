//
//  ContentView.swift
//  SocialComponents
//
//  Created by Ronald Joubert on 12/24/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 20) {
                ForEach(0..<5) { item in
                    TextPostView()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
