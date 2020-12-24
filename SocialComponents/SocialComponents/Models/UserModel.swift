//
//  UserModel.swift
//  SocialComponents
//
//  Created by Ronald Joubert on 12/24/20.
//

import SwiftUI

struct User: Identifiable {
    let id = UUID().uuidString
    let username, message: String
}
