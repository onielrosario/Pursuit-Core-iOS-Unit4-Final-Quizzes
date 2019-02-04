//
//  UserViewController.swift
//  Quizzes
//
//  Created by Oniel Rosario on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit



class UserViewController: UIViewController {
    @IBOutlet weak var userimage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    private var imagePicker: UIImagePickerController!
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        userimage.addGestureRecognizer(tapGesture)
        userimage.isUserInteractionEnabled = true
        userimage.layer.cornerRadius  = userimage.frame.width / 2
        userimage.clipsToBounds = true
        imagePickerView()
        userName.isEnabled = true
        if let username = userName.text {
            if username == "Username" {
                
            }
        }
    }
    private func imagePickerView() {
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
    }
    private func showImageController() {
        if let photoAlbum = imagePicker {
            photoAlbum.sourceType = .photoLibrary
            present(photoAlbum, animated: true, completion: nil)
        }
    }
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) { alert in }
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    @objc private func imageTapped(gesture: UITapGestureRecognizer) {
        if (gesture.view as? UIImageView) != nil {
            showImageController()
        }
    }
}
extension UserViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            
            userimage.image = image
        } else {
            print("original photo is nil")
        }
        dismiss(animated: true, completion: nil)
    }
}
