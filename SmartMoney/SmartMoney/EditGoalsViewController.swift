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
    @IBOutlet weak var addWarning: UILabel!
    @IBOutlet weak var removeWarning: UILabel!
    @IBOutlet weak var editWarning: UILabel!
    var user:User?
    var userModel:UserModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    @IBAction func add(_ sender: UIButton) {
        if addCategoryField.hasText && setLimitField.hasText {
            let name = addCategoryField.text
            let limit = Double(setLimitField.text!)
            let added = userModel?.addCategoryToUser(user!, name!, limit!)
            if !added! {
                addWarning.text = "Category Limit (4) Reached"
            }
            else {
                addWarning.text = ""
            }
            addCategoryField.text = ""
            setLimitField.text = ""
        }
        else {
            addWarning.text = "Required Fields Not Filled"
        }
    }
    
    
    @IBAction func remove(_ sender: UIButton) {
        if removeCategoryField.hasText {
            let removed = userModel?.removeCategory(user!, removeCategoryField.text!)
            if !removed! {
                removeWarning.text = "Category Not Found"
            }
            else {
                removeWarning.text = ""
            }
            removeCategoryField.text = ""
        }
        else {
            removeWarning.text = "Required Fields Not Filled"
        }
    }
    
    @IBAction func edit(_ sender: Any) {
        if editCategoryField.hasText && editSetLimitField.hasText{
            let name = editCategoryField.text
            let limit = Double(editSetLimitField.text!)
            let edited = userModel?.editCategory(user!, name!, limit!)
            if !edited! {
                editWarning.text = "Category Not Found"
            }
            else {
                editWarning.text = ""
            }
            editCategoryField.text = ""
            editSetLimitField.text = ""
        }
        else {
            editWarning.text = "Required Fields Not Filled"
        }
    }
}
