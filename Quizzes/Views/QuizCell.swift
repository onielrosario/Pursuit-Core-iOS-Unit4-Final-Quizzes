//
//  QuizCell.swift
//  Quizzes
//
//  Created by Oniel Rosario on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class QuizCell: UICollectionViewCell {
    lazy var quizCollectionViewLabelImage: UIImageView = {
        let imageview = UIImageView()
       backgroundColor = .white
        return imageview
    }()
    
    lazy var quizTitleLabel: UILabel = {
        let mylabel = UILabel()
        mylabel.textAlignment = .center
        mylabel.numberOfLines = 2
        mylabel.text = "Quiz title..."
        mylabel.textColor = .black
        return mylabel
    }()
    
    override init(frame: CGRect) {
       super.init(frame: UIScreen.main.bounds)
        backgroundColor = .white
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
super.init(coder: aDecoder)
        commonInit()
    }
    
    
    private func commonInit() {
        addImageConstrains()
        addLabelConstrains()
    }
    
    private func addImageConstrains() {
        addSubview(quizCollectionViewLabelImage)
        quizCollectionViewLabelImage.translatesAutoresizingMaskIntoConstraints = false
        quizCollectionViewLabelImage.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        quizCollectionViewLabelImage.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
    }
    
    private func addLabelConstrains() {
        addSubview(quizTitleLabel)
        quizTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        quizTitleLabel.centerXAnchor.constraint(equalTo: quizCollectionViewLabelImage.centerXAnchor).isActive = true
        quizTitleLabel.centerYAnchor.constraint(equalTo: quizCollectionViewLabelImage.centerYAnchor).isActive = true
        quizTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 11).isActive = true
         quizTitleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -11).isActive = true
    }
}

