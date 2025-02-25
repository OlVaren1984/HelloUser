//
//  ViewController.swift
//  HelloUser
//
//  Created by Олег Варенников  on 13.06.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var nameUserTextView: UITextField!
    @IBOutlet var paswordTextVew: UITextField!
    
    @IBOutlet var loginButton: UIButton!
    
    @IBOutlet var forgotUserName: UIButton!
    @IBOutlet var forgotPasswordButton: UIButton!
    
    var userName:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Градиент экрана, цвет шрифта вводимых данных
        GradientColors.applyGradient(to: view,
                                     topColor:
                                        AppColors.primatyColorView,
                                     bottonColor:
                                        AppColors.secondaryColorView)
        
        // Используем метод из GradientColors модель AppColors
        GradientColors.applyGradient(to: view,
                                     topColor:
                                        AppColors.primatyColorView,
                                     bottonColor:
                                        AppColors.secondaryColorView)
        
        //Устаавливаем для полей ввода установлены делегаты
        nameUserTextView.delegate = self
        paswordTextVew.delegate = self
        
        nameUserTextView.textColor = .black
        paswordTextVew.textColor = .black
        
        // Открытие клавиатуры при фокусе на поле логина
        nameUserTextView.becomeFirstResponder()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Обнуляем текстовые поля каждый раз, когда экран появляется
        // Оставляем условие если хотим обнулять оба поля
        // nameUserTextView.text = nil
        paswordTextVew.text = nil
    }
    
    @IBAction func loginInButton() {
        
        // Проверяем, пустое ли поле имени пользователя
        guard let inputText = nameUserTextView.text, !inputText.isEmpty else {
            AlertManager.showAlert(on: self, with: ErrorMessages.errorName, and: ErrorMessages.errorNameOleg)
            return
        }
        
        // Проверяем, не является ли введенное имя числом
        if let _ = Double(inputText) {
            AlertManager.showAlert(on: self, with: ErrorMessages.errorName, and: ErrorMessages.errorNumberUser)
            return
        }
        
        // Получаем список пользователей
        let users = User.getUserData()
        
        // Проверяем, существует ли пользователь с таким именем в базе
        guard users.contains(where: { $0.username == inputText }) else {
            AlertManager.showAlert(on: self, with: ErrorMessages.errorName, and: ErrorMessages.errorLogin)
            return
        }
        
        // Проверяем, пустое ли поле пароля
        guard let inputTextPassword = paswordTextVew.text, !inputTextPassword.isEmpty else {
            AlertManager.showAlert(on: self, with: ErrorMessages.errorName, and: ErrorMessages.errorPassword, passwordField: paswordTextVew)
            return
        }
        
        // Проверяем, не является ли пароль числом
        if let _ = Double(inputTextPassword) {
            AlertManager.showAlert(on: self, with: ErrorMessages.errorName, and: ErrorMessages.errorPasswordNumber, passwordField: paswordTextVew)
            return
        }
        
        // Проверяем, совпадает ли пароль с сохраненным у пользователя
        if users.first(where: { $0.username == inputText && $0.password == inputTextPassword }) == nil {
            AlertManager.showAlert(on: self, with: ErrorMessages.errorName, and: ErrorMessages.errorPasswordNumberTwo, passwordField: paswordTextVew)
        }
        
        
        
    }
    // передаем имя пользователя на второй экран
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetails" {
            let userDetailsVC = segue.destination as! UserListViewController
            // Передаем имя пользователя, только если оно задано
            if let username = nameUserTextView.text, !username.isEmpty {
                userDetailsVC.userName = username
            } else {
                userDetailsVC.userName = nil  // Если имя пустое, передаем nil
            }
        }
    }
    
    // кнопка возврата на первый экран "Выйти"
    @IBAction func unwindSegueToMainScreen(segue: UIStoryboardSegue){
        guard segue.identifier == "ShowDetails" else { return }
        guard segue.source is UserListViewController else { return }
        // Обнуляем поля при возврате на главный экран
        nameUserTextView.text = nil
        paswordTextVew.text = nil
        userName = nil  // Обнуляем переменную username
    }
    
    @IBAction func userNameButton() {
    }
    
    @IBAction func passwordButton() {
        paswordTextVew.isSecureTextEntry = true
    }
    
    // Всплывающее окно об ошибке заполнения поля Имя
    @IBAction func forgotUserButton() {
        AlertManagerMessage.alertUserName(on: self)
    }
    
    // Всплывающее окно об ошибке заполнения поля пароль
    @IBAction func forgotPasswordUserButton() {
        AlertManagerMessage.alertNumber(on: self)
    }
}

//MARK: - Text Filed Delegate
extension ViewController: UITextFieldDelegate {
    
    // Открытие клавиатуры при клике на поле
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == nameUserTextView {
            nameUserTextView.becomeFirstResponder()
        }
    }
    
    // Переход к следующему полю или выполнение действия
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == nameUserTextView {
            // Скрыть клавиатуру для имени пользователя и перейти к паролю
            textField.resignFirstResponder()
            paswordTextVew.becomeFirstResponder()
        } else if textField == paswordTextVew {
            // Если пароль введен, проверяем вход и выполняем переход
            textField.resignFirstResponder()
            loginInButton() // Логика для проверки входа
            
            // Если вход успешен, переходим на следующий экран
            if let username = nameUserTextView.text, let password = paswordTextVew.text, !username.isEmpty, !password.isEmpty {
                let users = User.getUserData()
                if users.first(where: { $0.username == username && $0.password == password }) != nil {
                    performSegue(withIdentifier: "ShowDetails", sender: nil)
                } else {
                    AlertManager.showAlert(on: self, with:ErrorMessages.errorName, and:ErrorMessages.errorPasswordNumberTwo)
                }
            } else {
                AlertManager.showAlert(on: self, with:ErrorMessages.errorName, and:ErrorMessages.errorAllFields)
            }
        }
        return true
    }
    
    // Закрытие клавиатуры при касании за пределами полей ввода
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
}



