//
//  MainViewController.swift
//  HelloUser
//
//  Created by Олег Варенников  on 19.06.2023.
//

import UIKit

class MainViewController: UIViewController {
    
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

    @IBOutlet var aboutMe: UILabel!
    
    var usserName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Градиент экрана
        addVerticalGradientLauer(topColor: primatyColor, bottonColor: secondaryColor)
        title = usserName
        

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

// MARK: - Set background color
extension MainViewController {
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
