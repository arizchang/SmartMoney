//
//  EditGoalsViewController.swift
//  SmartMoney
//
//  Created by Ariz Chang on 11/1/20.
//  Copyright © 2020 Ariz Chang. All rights reserved.
//

import UIKit

class EditGoalsViewController: UIViewController {

    @IBOutlet weak var setLimitField: UITextField!
    @IBOutlet weak var addCategoryField: UITextField!
    @IBOutlet weak var removeCategoryField: UITextField!
    @IBOutlet weak var editCategoryField: UITextField!
    @IBOutlet weak var editSetLimitField: UITextField!
    var user:User?
    var userModel:UserModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    @IBAction func add(_ sender: UIButton) {
        let name = addCategoryField.text
        let limit = Double(setLimitField.text!)
        userModel?.addCategoryToUser(user!, name!, limit!)
    }
    
    
    @IBAction func remove(_ sender: UIButton) {
    }
    
    
    @IBAction func Edit(_ sender: Any) {
    }
}
