//
//  MainViewController.swift
//  SmartMoney
//
//  Created by Ariz Chang on 11/1/20.
//  Copyright © 2020 Ariz Chang. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var category1Label: UILabel!
    @IBOutlet weak var category2Label: UILabel!
    @IBOutlet weak var category3Label: UILabel!
    @IBOutlet weak var category4Label: UILabel!
    var user:User?
    var userModel:UserModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print(user?.categoryList?.count)
        /*
        if user?.categoryList?.count == 1 {
            let categoryArray = user?.categoryList?.allObjects
            let category = (categoryArray![0] as AnyObject).categoryName!
            let currentAmount = (categoryArray![0] as AnyObject).currentAmount!
            let limitAmount = (categoryArray![0] as AnyObject).limitAmount!
            category1Label.text = "\(category!): $\(currentAmount)/$\(limitAmount)"
        }
         */
        
        let goalStrings = userModel?.getGoalsStrings(user!)
        
        if goalStrings?.count == 1 {
            category1Label.text = goalStrings![0]
        }
        else if goalStrings?.count == 2 {
            category1Label.text = goalStrings![0]
            category2Label.text = goalStrings![1]
        }
        else if goalStrings?.count == 3 {
            category1Label.text = goalStrings![0]
            category2Label.text = goalStrings![1]
            category3Label.text = goalStrings![2]
        }
        else if goalStrings?.count == 4 {
            category1Label.text = goalStrings![0]
            category2Label.text = goalStrings![1]
            category3Label.text = goalStrings![2]
            category4Label.text = goalStrings![3]
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let goalStrings = userModel?.getGoalsStrings(user!)
        
        if goalStrings?.count == 1 {
            category1Label.text = goalStrings![0]
        }
        else if goalStrings?.count == 2 {
            category1Label.text = goalStrings![0]
            category2Label.text = goalStrings![1]
        }
        else if goalStrings?.count == 3 {
            category1Label.text = goalStrings![0]
            category2Label.text = goalStrings![1]
            category3Label.text = goalStrings![2]
        }
        else if goalStrings?.count == 4 {
            category1Label.text = goalStrings![0]
            category2Label.text = goalStrings![1]
            category3Label.text = goalStrings![2]
            category4Label.text = goalStrings![3]
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if(segue.identifier == "toPayments") {
            if let viewController: PaymentsViewController = segue.destination as? PaymentsViewController {
                viewController.userModel = userModel
                viewController.user = user
            }
        }
        if(segue.identifier == "toEdit") {
            if let viewController: EditGoalsViewController = segue.destination as? EditGoalsViewController {
                viewController.userModel = userModel
                viewController.user = user
            }
        }
    }
    
}
