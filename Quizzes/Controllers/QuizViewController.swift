//
//  ViewController.swift
//  Quizzes
//
//  Created by Alex Paul on 1/31/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    private var quizes = [QuizFile]() {
        didSet {
            self.collectionView.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.backgroundColor = .gray
        self.quizes = QuizDataManager.getQuizesFromDocumentsDirectory()
    }
    override func viewWillAppear(_ animated: Bool) {
       self.quizes = QuizDataManager.getQuizesFromDocumentsDirectory()
    }
}
extension QuizViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return quizes.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "quizCell", for: indexPath) as? QuizCell else { return UICollectionViewCell() }
        let quiz = quizes[indexPath.row]
        cell.quizTitleLabel.text = quiz.name
        cell.delegate = self
        return cell
    }
}
extension QuizViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let DetailVC = QuizDetailViewController()
        let quiz = quizes[indexPath.row]
        DetailVC.quiz = quiz
        navigationController?.pushViewController(DetailVC, animated: true)
    }
}
extension QuizViewController: SearchCellDelegate {
    func saveQuiz() {
    }
    func updateQuizes(getQuizes: [QuizFile]) {
        self.quizes = getQuizes
    }
}
extension QuizViewController: CreatorDelegate {
    func updateCollection(collection: [QuizFile]) {
        self.quizes = collection
    }
}
extension QuizViewController: quizCellDelegate {
    func presentAction(alert: UIAlertController) {
        self.present(alert, animated: true, completion: nil)
    }
    func deleteQuiz(index: Int) {
        let quiz = QuizDataManager.getQuizesFromDocumentsDirectory()[index]
        QuizDataManager.delete(quiz: quiz, atindex: index)
        updateQuizes(getQuizes: QuizDataManager.getQuizesFromDocumentsDirectory())
        
    }
}
