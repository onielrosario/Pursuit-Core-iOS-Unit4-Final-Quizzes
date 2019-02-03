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
  }
    
    override func viewWillAppear(_ animated: Bool) {
        self.collectionView.reloadData()
    }
}



extension QuizViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return quizes.count
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "quizCell", for: indexPath) as? QuizCell else { return UICollectionViewCell() }
        
        
        return cell
    }
    
    
}

extension QuizViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//       guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "quizCell", for: indexPath) as? QuizCell else { return }
        let DetailVC = QuizDetailViewController()
        let quiz = quizes[indexPath.row]
        DetailVC.quiz = quiz
    navigationController?.pushViewController(DetailVC, animated: true)
        
    }
    
    
    
    
}
extension QuizViewController: SearchCellDelegate {
    func updateQuizes(getQuizes: [QuizFile]) {
        self.quizes = getQuizes
    }
    
    
}
