//
//  AddPhotoViewController.swift
//  Parstagram
//
//  Created by Atef Kai Benothman on 5/17/19.
//  Copyright © 2019 Atef Kai Benothman. All rights reserved.
//

import UIKit
import Parse
import AlamofireImage

class AddPhotoViewController: UIViewController, UIImagePickerControllerDelegate,
    UINavigationControllerDelegate
{
    
    // Outlets
    @IBOutlet weak var captionField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var imagePlaceholderImageView: UIImageView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        makeRoundedCorners(obj: submitButton)
        self.hideKeyboard()
    }
    
    func makeRoundedCorners(obj: UIButton)
    {
        obj.layer.cornerRadius = 10.0
        obj.layer.masksToBounds = true
    }
    
    @IBAction func onSubmit(_ sender: Any)
    {
        let post = PFObject(className: "Posts")
        
        post["caption"] = captionField.text
        post["author"] = PFUser.current()!
        
        let imageData = imagePlaceholderImageView.image!.pngData()
        let file = PFFileObject(data: imageData!)
        
        post["image"] = file
        
        post.saveInBackground { (success, error) in
            
            if success
            {
self.navigationController?.popToRootViewController(animated: true)
            }
        }
    }
    
    @IBAction func onCameraButton(_ sender: Any)
    {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        
        if UIImagePickerController.isSourceTypeAvailable(.camera)
        {
            picker.sourceType = .camera
        }
        else
        {
            picker.sourceType = .photoLibrary
        }
        
        present(picker, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])
    {
        let image = info[.editedImage] as! UIImage
        
        let size = CGSize(width: 300, height: 300)
        let scaledImage = image.af_imageScaled(to: size)
        
        imagePlaceholderImageView.image = scaledImage
        
        dismiss(animated: true, completion: nil)
    }
    
}
