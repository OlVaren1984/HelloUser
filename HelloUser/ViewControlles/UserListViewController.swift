//
//  UserListViewController.swift
//  HelloUser
//
//  Created by Олег Варенников  on 19.06.2023.
//

import UIKit

class UserListViewController: UIViewController {
    
 // MARK: Private Color
    private let primatyColor = UIColor(
        red: 210/255,
        green: 109/255,
        blue: 128/255,
        alpha: 1
    )
    private let secondaryColor = UIColor(
        red: 107/255,
        green: 148/255,
        blue: 230/255,
        alpha: 1
    )
    
    @IBOutlet var userLabel: UILabel!
    
    var userName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Градиент экрана
        addVerticalGradientLauer(topColor: primatyColor, bottonColor: secondaryColor)
        userLabel.text = userName ?? ""
        title = userName
        
    }
        
    @IBAction func exitUserButton(_ sender: UIButton) {
        performSegue(withIdentifier: "ShowDetails", sender: nil)
        //  dismiss(animated: true, completion: nil)
    }
}
// MARK: - Set background color
extension UserListViewController {
    func addVerticalGradientLauer(topColor: UIColor, bottonColor: UIColor) {
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [topColor.cgColor, bottonColor.cgColor]
        gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)
        view.layer.insertSublayer(gradient, at: 0)
    }
}
