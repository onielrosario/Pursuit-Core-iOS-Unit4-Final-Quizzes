//
//  QuizDetailView.swift
//  Quizzes
//
//  Created by Oniel Rosario on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class QuizDetailView: UIView {
    lazy var DetailCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize.init(width: 350, height: 500)
        layout.sectionInset = UIEdgeInsets.init(top: 20, left: 10, bottom: 20, right: 10)
        layout.scrollDirection = .vertical
        let myCollectionView = UICollectionView.init(frame: self.bounds, collectionViewLayout: layout)
        myCollectionView.backgroundColor = UIColor.clear.withAlphaComponent(0.5)
        myCollectionView.backgroundColor = .green
        myCollectionView.layer.cornerRadius = 10
        myCollectionView.register(DetailCollectionViewCell.self, forCellWithReuseIdentifier: "detailCell")
        return myCollectionView
    }()
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        CollectionViewUI()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func CollectionViewUI () {
        addSubview(DetailCollectionView)
        DetailCollectionView.translatesAutoresizingMaskIntoConstraints = false
        DetailCollectionView.widthAnchor.constraint(equalTo:self.widthAnchor).isActive = true
        DetailCollectionView.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
    }
}
