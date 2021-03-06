//
//  ProfileViewController.swift
//  Nokorimono
//
//  Created by Tejal Patel on 1/19/19.
//  Copyright © 2019 Tejal Patel. All rights reserved.
//

import UIKit
import AlamofireImage

class ProfileViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var bannerImage: UIImageView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    lazy var imageObject = {self.profileImage}()
    var imageName = "profile"
    //var imageObject = self.profileImage
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onProfileButton(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            picker.sourceType = .camera
        } else {
            picker.sourceType = .photoLibrary
        }
        
        present(picker, animated: true, completion: nil)
        imageObject = self.profileImage
        imageName = "profile"
    }
    
    @IBAction func onBannerButton(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            picker.sourceType = .camera
        } else {
            picker.sourceType = .photoLibrary
        }
        
        present(picker, animated: true, completion: nil)
        imageObject = self.bannerImage
        imageName = "banner"
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.editedImage] as! UIImage
        var size = CGSize(width: 375, height: 140)
        // THERE IS A PROBLEM WITH SIZING
        if imageName == "profile" {
            var size = CGSize(width: 140, height: 140)
        }
        
        let scaledImage = image.af_imageScaled(to: size)
        
        imageObject?.image = scaledImage
        
        dismiss(animated: true, completion: nil)
    }
}
