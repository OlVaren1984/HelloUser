//
//  UserListViewController.swift
//  HelloUser
//
//  Created by Олег Варенников  on 19.06.2023.
//

import UIKit

class UserListViewController: UIViewController {
    
    
    @IBOutlet var userLabel: UILabel!

    
    var userName: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
     userLabel.text = userName ?? ""
    }
    
    
    @IBAction func exitUserButton(_ sender: UIButton) {
        performSegue(withIdentifier: "ShowDetails", sender: nil)
      //  dismiss(animated: true, completion: nil)
    }


 //   @IBAction func cancelToPlayersViewController(segue:UIStoryboardSegue) {
    // performSegue(withIdentifier: "ShowDetails", sender: nil)
//        dismiss(animated: true, completion: nil)
   // }
    
// }
}

