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
protocol UserIsEmptyDelegate: AnyObject {
    func isUsernameEmpty()
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
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) { alert in }
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    @objc private func create() {
        let id = UUID().uuidString
        let date = Date.getISOTimestamp()
        let createdAt = date.formatISODateString(dateFormat: "MMM d, yyyy")
        guard let title = TitleTextField.text else { return }
        if let factOne = factOneTextView.text {
            if let factTwo = FactTwoTextView.text {
                let newQuiz = QuizFile.init(id: id, name: title, facts: [factOne,factTwo], dateAdded: createdAt)
                let savedQuiz = QuizDataManager.saveQuizesToDocumentsDirectory(newQuiz: newQuiz)
                if let error = savedQuiz.error {
                    showAlert(title: "", message: "could not save Quiz: \(error.localizedDescription)")
                } else {
                    showAlert(title: "", message: "new quiz saved")
                }
                
            } else  {
                showAlert(title: "", message: "please fill out fact two textfield")
            }
        } else {
            showAlert(title: "", message: "fact One TextField empty")
        }
        self.creatorDelegate?.updateCollection(collection: QuizDataManager.getQuizesFromDocumentsDirectory())
    }
}


