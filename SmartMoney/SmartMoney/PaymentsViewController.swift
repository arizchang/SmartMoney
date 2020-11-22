//
//  PaymentsViewController.swift
//  SmartMoney
//
//  Created by Ariz Chang on 11/1/20.
//  Copyright © 2020 Ariz Chang. All rights reserved.
//

import UIKit

class PaymentsViewController: UIViewController {

    @IBOutlet weak var categoryField: UITextField!
    @IBOutlet weak var amountField: UITextField!
    var user:User?
    var userModel:UserModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func addPayment(_ sender: UIButton) {
        let category = categoryField.text
        let amount = Double(amountField.text!)
        
        userModel?.addPaymentToUser(user!, category!, amount!)
        print(user?.paymentList)
    }
    
}
