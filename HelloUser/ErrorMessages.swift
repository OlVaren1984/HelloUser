//
//  ErrorMessages.swift
//  HelloUser
//
//  Created by Олег on 16.02.2025.
//

import Foundation
import UIKit

struct ErrorMessages {
    static let ok = "OK"
    static let errorName = "Ошибка"
    static let errorClue = "Подсказка!"
    static let errorNameUser = "Произошла ошибка, Вы не заполнили имя пользователя, введите имя"
    static let errorNumberUser = "Произошла ошибка, Вы использовали число при вводе имени"
    static let errorNameOleg = "Произошла ошибка, Вы не заполнили имя пользователя, Ваше имя: - Олег"
    static let errorPassword = "Вы не ввели пароль, пожалуйтса введите правильный пароль, если вы не можете вспомнить - воспользуйтесь подсказкой!"
    static let errorPasswordNumber = "Произошла ошибка, Вы использовали число при вводе пароля, если вы не можете вспомнить - воспользуйтесь подсказкой!"
    static let errorPasswordNumberTwo = "Произошла ошибка, Вы ввели неправильный пароль"
    static let errorPasswordNumberThree = "Произошла ошибка, пользователь не найден"
    static let errorCorrectPassword = "Неправильный пароль, Ваш пароль: - Пароль"
    static let errorAllFields = "Пожалуйста, заполните все поля."
    static let errorLogin = "Нет зарегистрированного пользователя с таким логином, пожалуйста введите правильное имя!"
}
//Общий Алерт контроллер
class AlertManager {
    static func showAlert(on viewController: UIViewController, with title: String, and message: String, passwordField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: ErrorMessages.ok, style: .default) { _ in
            DispatchQueue.main.async {
                passwordField?.text = nil // Обнуляем поле после закрытия алерта
            }
        }
        alert.addAction(okAction)
        
        viewController.present(alert, animated: true, completion: nil)
    }
}

//Алерт на подсказку правильнго имени и пароля
class AlertManagerMessage {
    static func alertUserName(on viewController: UIViewController) {
        AlertManager.showAlert(on: viewController, with: ErrorMessages.errorClue, and: ErrorMessages.errorNameOleg)
    }
    
    static func alertNumber(on viewController: UIViewController) {
        AlertManager.showAlert(on: viewController, with: ErrorMessages.errorClue, and: ErrorMessages.errorCorrectPassword)
    }
}
