//
//  UserPassword.swift
//  boxpassw
//
//  Created by Rodrigo Lima on 23/03/23.
//

import Foundation

struct UserPassword: Identifiable {
    let id = UUID()
    let name: String
    let username: String
    let password: String
    let created: Date = Date.now
    let active: Bool = true
}
