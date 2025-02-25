//
//  ApplicationUser.swift
//  HelloUser
//
//  Created by Олег Варенников  on 16.06.2023.
//

import Foundation

struct User {
    let username: String
    let password: String
    
    // Статический метод внутри структуры User
    static func getUserData() -> [User] {
        return [
            User(username: "admin", password: "admin"),
            User(username: "Олег", password: "Пароль")
        ]
    }
}
