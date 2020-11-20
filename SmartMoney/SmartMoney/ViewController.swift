//
//  ViewController.swift
//  SmartMoney
//
//  Created by Ariz Chang on 11/1/20.
//  Copyright © 2020 Ariz Chang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var userModel:UserModel?
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()
        userModel = UserModel(managedObjectContext)
        print(userModel!.getCount())
        let image = UIImage(named: "blankProfilePic.png")?.pngData()
        userModel?.add("arizchang", "1234", image!)
    }


}

