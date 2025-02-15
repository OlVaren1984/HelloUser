//
//  Hobbies.swift
//  HelloUser
//
//  Created by Олег Варенников  on 16.06.2023.
//

enum HobbiesUser: Character {
    case skiing = "⛷"
    case bike = "🚴"
    case swimming = "🏊‍♀️"
    case chess = "♟"
    
    var definition: String {
        switch self {
        case .skiing:
            return "Если на улице зима, я люблю кататься на горных лыжах"
        case .bike:
            return "Если на улице весна, я люблю кататься на велосипеде"
        case .swimming:
            return "Если на улице лето, я люблю плавать на море"
        case .chess:
            return "Если на улице осень, я люблю играть в шахматы"
        }
    }
    
}
