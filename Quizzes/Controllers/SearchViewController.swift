//
//  SearchViewController.swift
//  Quizzes
//
//  Created by Oniel Rosario on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
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
}


extension SearchViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return quizes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "searchCell", for: indexPath) as? SearchCell else { return UICollectionViewCell() }
        let quiz = quizes[indexPath.row]
        cell.searchQuizLabel.text = quiz.quizTitle
        return cell
    }
    
    
}
