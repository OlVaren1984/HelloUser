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
    
    private let errorOk = "OK"
    private let errorName = "Ошибка"
    private let errorСlue = "Подсказка!"
    private let errorNameUser = "Произошла ошибка, Вы не заполнили имя пользователя, введите имя"
    private let errorNumberUser = "Произошла ошибка, Вы использовали число при вводе имени"
    private let errorNameOleg = "Произошла ошибка, Вы не заполнили имя пользователя, Ваше имя: - Олег"
    private let errorPassword = "Вы не ввели пароль, пожалуйтса введите правильный пароль, если вы не можете вспомнить - воспользуйтесь подсказкой!"
    private let errorPasswordNumber = "Произошла ошибка, Вы использовали число при вводе пароля, если вы не можете вспомнить - воспользуйтесь подсказкой!"
    private let errorPasswordNumberTwo = "Произошла ошибка, Вы ввели неправильный пароль"
    private let errorPasswordNumberThree = "Произошла ошибка, пользователь не найден"
    private let errorCorrectPassword = "Неправильный пароль, Ваш пароль: - Пароль"
    
    
    var userName:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameUserTextView.textColor = .black
        paswordTextVew.textColor = .black
    }
    
    @IBAction func loginInButton() {
        //проверяем текстовое поле пустое или нет
        guard let imputText = nameUserTextView.text, !imputText.isEmpty else {
            showAlert(with: errorName, and: errorNameUser)
            return
        }
        // проверяем число или нет
        if let _ = Double(imputText) {
            showAlert(with: errorName, and: errorNumberUser)
            return
        }
        
        nameUserTextView.text = imputText
        
        //проверяем текстовое поле пустое или нет
        guard let imputTextPassword = paswordTextVew.text,
              !imputTextPassword.isEmpty else {
            showAlert(with: errorName, and: errorPassword)
            return // а иначе выходим из метода
        }
        // проверяем число или нет
        if let _ = Double(imputTextPassword) {
            showAlert(with: errorName, and: errorPasswordNumber)
            return
        }
        
        paswordTextVew.text = imputTextPassword
        
        struct User {
            let username: String
            let password: String
        }
        
        let users = [
            User(username: "admin", password: "admin"),
            User(username: "Олег", password: "Пароль")
        ]
        
        guard let username = nameUserTextView.text, !username.isEmpty else {
            // Если логин не введен, вывести сообщение об ошибке
            showAlert(with: errorName, and: errorOk)
            return
        }
        
        guard let password = paswordTextVew.text, !password.isEmpty else {
            // Если пароль не введен, вывести сообщение об ошибке
            showAlert(with: errorName, and: errorPasswordNumberTwo)
            return
        }
        
        // Ищем пользователя с введенным логином и паролем в массиве users
        if users.first(where: { $0.username == username && $0.password == password }) != nil {
        } else {
            // Если пользователь не найден, вывести сообщение об ошибке
            showAlert(with: errorName, and: errorPasswordNumberTwo)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetails" {
            let userDetailsVC = segue.destination as! UserListViewController
            userDetailsVC.userName = nameUserTextView.text //sender as? String
        }
    }
    
    private func alertUserName() {
        showAlert(with: errorСlue, and: errorNameOleg)
    }
    
    private func alertNumber() {
        showAlert(with: errorСlue, and: errorCorrectPassword)
    }
    
    @IBAction func unwindSegueToMainScreen(segue: UIStoryboardSegue){
        guard segue.identifier == "ShowDetails" else { return }
        guard segue.source is UserListViewController else { return }
       
            self.nameUserTextView.text = ""
            self.paswordTextVew.text = ""
    }
    
    @IBAction func userNameButton() {
    }
    
    @IBAction func passwordButton() {
        paswordTextVew.isSecureTextEntry = true
    }
    
    // Всплывающее окно об ошибке заполнения поля Имя
    @IBAction func forgotUserButton() {
        alertUserName()
    }
    
    // Всплывающее окно об ошибке заполнения поля пароль
    @IBAction func forgotPasswordUserButton() {
        alertNumber()
    }
}

//MARK: - UIAlertController
extension ViewController {
    private func showAlert(with title: String, and message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAktion = UIAlertAction(title: errorOk, style: .default) { _ in
            //  self.nameUserTextView.text = nil
            self.paswordTextVew.text = nil
            //обнуление заполняемого поля ввода пароля
        }
        alert.addAction(okAktion)
        present(alert, animated: true)
    }
    
}

//MARK: - UITextFieldDelegate
extension ViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == nameUserTextView {
            textField.resignFirstResponder()
            paswordTextVew.becomeFirstResponder()
        } else {
            loginInButton()
        }
        return true
        
    }
}

