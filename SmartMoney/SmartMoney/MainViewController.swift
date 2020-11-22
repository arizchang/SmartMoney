//
//  MainViewController.swift
//  SmartMoney
//
//  Created by Ariz Chang on 11/1/20.
//  Copyright © 2020 Ariz Chang. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    var userModel:UserModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if(segue.identifier == "toPayments") {
            if let viewController: PaymentsViewController = segue.destination as? PaymentsViewController {
                viewController.userModel = userModel
            }
        }
    }
    
}
