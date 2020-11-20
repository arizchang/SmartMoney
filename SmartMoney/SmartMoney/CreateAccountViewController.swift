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
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        
        picker .dismiss(animated: true, completion: nil)

        let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        profilePic.image = UIImage(data: image!.pngData()! as Data)
    }
    
}
