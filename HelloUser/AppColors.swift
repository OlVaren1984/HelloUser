//
//  AppColors.swift
//  HelloUser
//
//  Created by Олег on 24.02.2025.
//

import UIKit

// MARK: - Set background color
struct AppColors {
    static let primatyColorView = UIColor(
        red: 210/255,
        green: 109/255,
        blue: 128/255,
        alpha: 1
    )
    static let secondaryColorView = UIColor(
        red: 107/255,
        green: 148/255,
        blue: 230/255,
        alpha: 1
    )
}

final class GradientColors {
   static func applyGradient(to view: UIView, topColor: UIColor, bottonColor: UIColor) {
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds // задаем границы, как будет располагаться цвет  - по границам экрана (view)
        gradient.colors = [topColor.cgColor, bottonColor.cgColor]
        gradient.locations = [0.0, 1.0] // задаем границы от куда начать и где закончить, весь экран площадь - это 1, соответственно от 0 до   1
        gradient.startPoint = CGPoint(x: 0, y: 0) // передаем координаты, откуда начать
        gradient.endPoint = CGPoint(x: 0, y: 1) // передаем координаты, где закончить
        view.layer.insertSublayer(gradient, at: 0) // вызываем градиент
    }
}

