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
    override func viewDidLoad() {
        super.viewDidLoad()
    userimage.layer.cornerRadius  = userimage.frame.width / 2
        userimage.clipsToBounds = true
    }
    
   
}
