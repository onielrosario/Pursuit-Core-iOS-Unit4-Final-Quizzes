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
       guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "detailCell", for: indexPath) as? DetailCollectionViewCell else { return }
       let view = cell.contentView
       UIView.transition(from: view, to: view, duration: 0.1, options: [.transitionFlipFromRight])
    }

}
