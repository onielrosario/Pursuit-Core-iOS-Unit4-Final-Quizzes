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
    private var quizes = [Quiz]() {
        didSet {
                self.collectionView.reloadData()
        }
    }

  override func viewDidLoad() {
    super.viewDidLoad()
    self.collectionView.dataSource = self
    self.collectionView.delegate = self
  
  }
}


extension QuizViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return quizes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "quizCell", for: indexPath) as? QuizCell else { return UICollectionViewCell() }
        
        
        return cell
    }
    
    
}

extension QuizViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "quizCell", for: indexPath) as? QuizCell else { return }
        let DetailVC = QuizDetailViewController()
        let quizFacts = quizes[indexPath.row]
       
    navigationController?.pushViewController(DetailVC, animated: true)
        
    }
    
    
    
    
}
