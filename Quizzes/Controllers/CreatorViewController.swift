//
//  CreatorViewController.swift
//  Quizzes
//
//  Created by Oniel Rosario on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

protocol CreatorDelegate: AnyObject {
   func updateCollection(collection: [QuizFile])
}



class CreatorViewController: UIViewController {
    weak var creatorDelegate: CreatorDelegate?
    @IBOutlet weak var TitleTextField: UITextField!
    @IBOutlet weak var factOneTextView: UITextView!
    @IBOutlet weak var FactTwoTextView: UITextView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
 self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "Create", style: .plain, target: self, action: #selector(create))
    }
    

    @objc private func create() {
        print("create pressed")
        
        self.creatorDelegate?.updateCollection(collection: QuizDataManager.getQuizesFromDocumentsDirectory())
    }

}
