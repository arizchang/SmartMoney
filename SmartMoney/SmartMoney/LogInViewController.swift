//
//  LogInViewController.swift
//  SmartMoney
//
//  Created by Ariz Chang on 11/1/20.
//  Copyright © 2020 Ariz Chang. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var warningLabel: UILabel!
    var user:User?
    var userModel:UserModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func logIn(_ sender: UIButton) {
        let username = usernameField.text
        let password = passwordField.text
        user = userModel?.getUserWithPassword(username!, password!)
        if user == nil {
            warningLabel.text = "Wrong username or password"
        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        return user != nil
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if(segue.identifier == "fromLogToMain") {
            if let viewController: MainViewController = segue.destination as? MainViewController {
                viewController.userModel = userModel
                viewController.user = user
            }
        }
    }
    
}
