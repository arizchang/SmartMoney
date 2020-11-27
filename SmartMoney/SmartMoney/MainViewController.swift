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

        let goalStrings = userModel?.getGoalsStrings(user!)
        
        if goalStrings?.count == 1 {
            category1Label.textColor = UIColor.green
            category1Label.text = goalStrings![0].0
            if goalStrings![0].1 {
                category1Label.textColor = UIColor.red
            }
        }
        else if goalStrings?.count == 2 {
            category1Label.textColor = UIColor.green
            category2Label.textColor = UIColor.green
            category1Label.text = goalStrings![0].0
            category2Label.text = goalStrings![1].0
            if goalStrings![0].1 {
                category1Label.textColor = UIColor.red
            }
            if goalStrings![1].1 {
                category2Label.textColor = UIColor.red
            }
        }
        else if goalStrings?.count == 3 {
            category1Label.textColor = UIColor.green
            category2Label.textColor = UIColor.green
            category3Label.textColor = UIColor.green
            category1Label.text = goalStrings![0].0
            category2Label.text = goalStrings![1].0
            category3Label.text = goalStrings![2].0
            if goalStrings![0].1 {
                category1Label.textColor = UIColor.red
            }
            if goalStrings![1].1 {
                category2Label.textColor = UIColor.red
            }
            if goalStrings![2].1 {
                category3Label.textColor = UIColor.red
            }
        }
        else if goalStrings?.count == 4 {
            category1Label.textColor = UIColor.green
            category2Label.textColor = UIColor.green
            category3Label.textColor = UIColor.green
            category4Label.textColor = UIColor.green
            category1Label.text = goalStrings![0].0
            category2Label.text = goalStrings![1].0
            category3Label.text = goalStrings![2].0
            category4Label.text = goalStrings![3].0
            if goalStrings![0].1 {
                category1Label.textColor = UIColor.red
            }
            if goalStrings![1].1 {
                category2Label.textColor = UIColor.red
            }
            if goalStrings![2].1 {
                category3Label.textColor = UIColor.red
            }
            if goalStrings![3].1 {
                category4Label.textColor = UIColor.red
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let goalStrings = userModel?.getGoalsStrings(user!)
        
        if goalStrings?.count == 1 {
            category1Label.textColor = UIColor.green
            category1Label.text = goalStrings![0].0
            if goalStrings![0].1 {
                category1Label.textColor = UIColor.red
            }
        }
        else if goalStrings?.count == 2 {
            category1Label.textColor = UIColor.green
            category2Label.textColor = UIColor.green
            category1Label.text = goalStrings![0].0
            category2Label.text = goalStrings![1].0
            if goalStrings![0].1 {
                category1Label.textColor = UIColor.red
            }
            if goalStrings![1].1 {
                category2Label.textColor = UIColor.red
            }
        }
        else if goalStrings?.count == 3 {
            category1Label.textColor = UIColor.green
            category2Label.textColor = UIColor.green
            category3Label.textColor = UIColor.green
            category1Label.text = goalStrings![0].0
            category2Label.text = goalStrings![1].0
            category3Label.text = goalStrings![2].0
            if goalStrings![0].1 {
                category1Label.textColor = UIColor.red
            }
            if goalStrings![1].1 {
                category2Label.textColor = UIColor.red
            }
            if goalStrings![2].1 {
                category3Label.textColor = UIColor.red
            }
        }
        else if goalStrings?.count == 4 {
            category1Label.textColor = UIColor.green
            category2Label.textColor = UIColor.green
            category3Label.textColor = UIColor.green
            category4Label.textColor = UIColor.green
            category1Label.text = goalStrings![0].0
            category2Label.text = goalStrings![1].0
            category3Label.text = goalStrings![2].0
            category4Label.text = goalStrings![3].0
            if goalStrings![0].1 {
                category1Label.textColor = UIColor.red
            }
            if goalStrings![1].1 {
                category2Label.textColor = UIColor.red
            }
            if goalStrings![2].1 {
                category3Label.textColor = UIColor.red
            }
            if goalStrings![3].1 {
                category4Label.textColor = UIColor.red
            }
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
