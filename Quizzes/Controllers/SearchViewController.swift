//
//  SearchViewController.swift
//  Quizzes
//
//  Created by Oniel Rosario on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    private var index = 0
    let searchView = SearchQuizzesView()
    private var quizes = [Quiz]() {
        didSet {
            DispatchQueue.main.async {
                self.searchView.SearchCollectionView.reloadData()
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(searchView)
        searchView.SearchCollectionView.dataSource = self
        searchView.SearchCollectionView.delegate = self
        getQuizes()
    }
    private func getQuizes() {
        quizAPIClient.getWeather { (error, quizes) in
            if let error = error {
                print("error: \(error)")
            } else if let quizes = quizes {
                self.quizes = quizes
            }
        }
    }
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) { alert in }
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}
extension SearchViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return quizes.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "searchCell", for: indexPath) as? SearchCell else { return UICollectionViewCell() }
        let quiz = quizes[indexPath.row]
        cell.searchQuizLabel.text = quiz.quizTitle
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard collectionView.dequeueReusableCell(withReuseIdentifier: "searchCell", for: indexPath) is SearchCell else { return }
        index = indexPath.row
        saveQuiz()
    }
}


extension SearchViewController: SearchCellDelegate {
    func updateQuizes(getQuizes: [QuizFile]) {
    }
    
    func saveQuiz() {
        let quiz = quizes[index]
        guard !QuizDataManager.isSame(id: quiz.id) else {
            showAlert(title: "Duplicate", message: "\(quiz.quizTitle) already exist in your Collection")
            return
        }
        let date = Date.getISOTimestamp()
        let createdAt = date.formatISODateString(dateFormat: "MMM d, yyyy")
        let newQuiz = QuizFile.init(id: quiz.id, name: quiz.quizTitle, facts: quiz.facts, dateAdded: createdAt)
        let savedQuiz = QuizDataManager.saveQuizesToDocumentsDirectory(newQuiz: newQuiz)
        if let error = savedQuiz.error {
            showAlert(title: "saving error", message: "error saving: \(error.localizedDescription)")
        } else {
            showAlert(title: "", message: "\(quiz.quizTitle) added to collection")
        }
        updateQuizes(getQuizes: QuizDataManager.getQuizesFromDocumentsDirectory())
    }
}
