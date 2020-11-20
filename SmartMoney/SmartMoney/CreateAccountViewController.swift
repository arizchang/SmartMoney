//
//  CreateAccountViewController.swift
//  SmartMoney
//
//  Created by Ariz Chang on 11/1/20.
//  Copyright © 2020 Ariz Chang. All rights reserved.
//

import UIKit

class CreateAccountViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var profilePic: UIImageView!
    var userModel:UserModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profilePic.image = UIImage(named: "blankProfilePic.png")
    }
    
}
