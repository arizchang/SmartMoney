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
    
    
    @IBAction func changeProfilePicCamera(_ sender: UIButton) {
        let picker = UIImagePickerController()
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            picker.allowsEditing = false
            picker.sourceType = UIImagePickerController.SourceType.camera
            picker.cameraCaptureMode = .photo
            picker.modalPresentationStyle = .fullScreen
            present(picker,animated: true,completion: nil)
        } else {
            print("No camera")
            warningLabel.text = "No Camera"
        }
    }
    
    @IBAction func create(_ sender: UIButton) {
        if usernameField.hasText && passwordField.hasText {
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
        else {
            warningLabel.text = "Required Fields Not Filled"
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if(segue.identifier == "fromCreateToMain") {
            if let viewController: MainViewController = segue.destination as? MainViewController {
                viewController.userModel = userModel
                viewController.user = newUser
            }
        }
    }
    
}
