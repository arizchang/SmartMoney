//
//  PaymentsViewController.swift
//  SmartMoney
//
//  Created by Ariz Chang on 11/1/20.
//  Copyright © 2020 Ariz Chang. All rights reserved.
//

import UIKit

class PaymentsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var categoryField: UITextField!
    @IBOutlet weak var amountField: UITextField!
    @IBOutlet weak var paymentTable: UITableView!
    @IBOutlet weak var warning: UILabel!
    var category:String?
    var amount:Double?
    var user:User?
    var userModel:UserModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func addPayment(_ sender: UIButton) {
        if categoryField.hasText && amountField.hasText {
            category = categoryField.text!
            amount = Double(amountField.text!)!
            
            let added = userModel?.addPaymentToUser(user!, category!, amount!)
            if !added! {
                warning.text = "Category Not Found"
            }
            categoryField.text = ""
            amountField.text = ""
            paymentTable.reloadData()
        }
        else {
            warning.text = "Required Fields Not Filled"
        }

    }
    
    
    @IBAction func clearPayments(_ sender: UIBarButtonItem) {
        for payment in user!.paymentList! {
            user!.removeFromPaymentList(payment as! Payment)
        }
        userModel!.clearCurrentAmounts(user!)
        
        paymentTable.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return user!.paymentList!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = paymentTable.dequeueReusableCell(withIdentifier: "paymentCell", for: indexPath)
        cell.layer.borderWidth = 1.0
        let paymentsArray = user?.paymentList?.allObjects
        let category = (paymentsArray![indexPath.row] as AnyObject).category!
        let amount = (paymentsArray![indexPath.row] as AnyObject).amount!

        cell.textLabel?.text = "\(category!): $\(amount)"
        
        return cell
    }
    
}
