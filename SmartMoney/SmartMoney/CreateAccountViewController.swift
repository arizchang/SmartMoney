//
//  CreateAccountViewController.swift
//  SmartMoney
//
//  Created by Ariz Chang on 11/1/20.
//  Copyright © 2020 Ariz Chang. All rights reserved.
//

import UIKit

class CreateAccountViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var profilePic: UIImageView!
    @IBOutlet weak var warningLabel: UILabel!
    var newUser:User?
    var userModel:UserModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profilePic.image = UIImage(named: "blankProfilePic.png")
    }
    
    
    @IBAction func changeProfilePic(_ sender: UIButton) {
        let photoPicker = UIImagePickerController()
        photoPicker.delegate = self
        photoPicker.sourceType = .photoLibrary
        self.present(photoPicker, animated: true, completion: nil)
    }
    
    
    @IBAction func create(_ sender: UIButton) {
        let username = usernameField.text
        let password = passwordField.text
        let picture = profilePic.image?.pngData()
        newUser = userModel?.add(username!, password!, picture!)

        if newUser != nil {
            warningLabel.text = "Successfully Created!"
        }
        else {
            warningLabel.text = "That username is taken!"
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        
        picker .dismiss(animated: true, completion: nil)

        let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        profilePic.image = UIImage(data: image!.pngData()! as Data)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        return newUser != nil
    }
    
}
