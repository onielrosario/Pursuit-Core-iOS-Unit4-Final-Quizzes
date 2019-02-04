//
//  SearchQuizzesView.swift
//  Quizzes
//
//  Created by Oniel Rosario on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class SearchQuizzesView: UIView {
    lazy var SearchCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize.init(width: 300, height: 300)
        layout.sectionInset = UIEdgeInsets.init(top: 20, left: 10, bottom: 20, right: 10)
        layout.scrollDirection = .vertical
        let myCollectionView = UICollectionView.init(frame: self.bounds, collectionViewLayout: layout)
        myCollectionView.backgroundColor = UIColor.clear.withAlphaComponent(0.5)
        myCollectionView.backgroundColor = .blue
        myCollectionView.layer.cornerRadius = 10
        myCollectionView.register(SearchCell.self, forCellWithReuseIdentifier: "searchCell")
        return myCollectionView
    }()
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commoninit()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func commoninit() {
        addSearchCollectionConstrains()
    }
    private func addSearchCollectionConstrains() {
        addSubview(SearchCollectionView)
        SearchCollectionView.translatesAutoresizingMaskIntoConstraints = false
        SearchCollectionView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        SearchCollectionView.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
    }
}
