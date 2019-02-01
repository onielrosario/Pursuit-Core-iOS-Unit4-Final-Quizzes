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
    let detailView = QuizDetailView()
    private var quizes = [Quiz]() {
        didSet {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }

  override func viewDidLoad() {
    super.viewDidLoad()
    view.addSubview(detailView)
    collectionView.register(QuizCell.self, forCellWithReuseIdentifier: "quizCell")
  
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
