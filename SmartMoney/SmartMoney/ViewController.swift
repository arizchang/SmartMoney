//
//  ViewController.swift
//  SmartMoney
//
//  Created by Ariz Chang on 11/1/20.
//  Copyright © 2020 Ariz Chang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var picture: UIImageView!
    var userModel:UserModel?
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()
        userModel = UserModel(managedObjectContext)
        print(userModel!.getCount())
        picture.image = UIImage(named: "money.jpg")
        for user in userModel!.userList {
            let theUser = user as! User
            print(theUser.password)
        }
        //let image = UIImage(named: "blankProfilePic.png")?.pngData()
        //userModel?.add("arizchang", "1234", image!)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if(segue.identifier == "toCreateAccount") {
            if let viewController: CreateAccountViewController = segue.destination as? CreateAccountViewController {
                viewController.userModel = userModel
            }
        }
        if(segue.identifier == "toLogIn") {
            if let viewController: LogInViewController = segue.destination as? LogInViewController {
                viewController.userModel = userModel
            }
        }
    }

    // REMOVE THIS WHEN ENTERING PRODUCTION
    @IBAction func clear(_ sender: Any) {
        
        for user in userModel!.userList {
            userModel?.remove(user)
        }
    }
}

