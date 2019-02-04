//
//  QuizDetailViewController.swift
//  Quizzes
//
//  Created by Oniel Rosario on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class QuizDetailViewController: UIViewController {
    public var quiz: QuizFile!
    let detailView = QuizDetailView()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(detailView)
        self.detailView.DetailCollectionView.dataSource = self
        self.detailView.DetailCollectionView.delegate = self
        title = "\(quiz.name)"
    }
}
extension QuizDetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return quiz.facts.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "detailCell", for: indexPath) as? DetailCollectionViewCell else {return UICollectionViewCell() }
        cell.DetailTitleLabel.text = quiz.name
        return cell
    }
}
extension QuizDetailViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! DetailCollectionViewCell
        let fact = quiz.facts[indexPath.row]
        if cell.isFlipped == false {
            cell.DetailTitleLabel.text = fact
            cell.flipCell()
            cell.isFlipped = true
        } else {
            cell.DetailTitleLabel.text = quiz.name
            cell.isFlipped = false
            cell.flipBack()
        }
    }
}
