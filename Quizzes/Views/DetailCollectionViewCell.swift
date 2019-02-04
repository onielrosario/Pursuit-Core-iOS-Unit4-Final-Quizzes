//
//  DetailCollectionViewCell.swift
//  Quizzes
//
//  Created by Oniel Rosario on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class DetailCollectionViewCell: UICollectionViewCell {
    var isFlipped = false
    lazy var DetailCollectionViewLabelImage: UIImageView = {
        let imageview = UIImageView()
        backgroundColor = .white
        return imageview
    }()
    lazy var DetailCollectionViewTextviewsImage: UIImageView = {
        let imageview = UIImageView()
        backgroundColor = .white
        return imageview
    }()
    lazy var DetailCellTextViewOne: UITextView = {
        let myTextView = UITextView()
        myTextView.textColor = .white
        myTextView.backgroundColor = .gray
        myTextView.textAlignment = .center
        myTextView.text = "Facts #1..."
        myTextView.isEditable = false
        myTextView.isSelectable = false
        return myTextView
    }()
    lazy var DetailCellTextViewTwo: UITextView = {
        let myTextView = UITextView()
        myTextView.textColor = .black
        myTextView.textAlignment = .center
        myTextView.text = "Facts #2..."
        myTextView.isEditable = false
        myTextView.isSelectable = false
        return myTextView
    }()
    lazy var DetailTitleLabel: UILabel = {
        let mylabel = UILabel()
        mylabel.textAlignment = .center
        mylabel.text = "Quiz title..."
        mylabel.numberOfLines = 8
        mylabel.textColor = .black
        return mylabel
    }()
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        backgroundColor = .white
        commonInit()
    }
    
    func flipBack() {
        UIView.transition(from: DetailTitleLabel, to: DetailTitleLabel, duration: 0.5, options: [.transitionFlipFromRight, .showHideTransitionViews], completion: nil)
    }
    
    func flipCell() {
        UIView.transition(from: DetailTitleLabel, to: DetailTitleLabel, duration: 0.5, options: [.transitionFlipFromLeft, .showHideTransitionViews], completion: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func commonInit() {
        addLabelConstrains()
        addTexviewsConstrains()
    }
    private func addImageConstrains() {
        addSubview(DetailCollectionViewLabelImage)
        DetailCollectionViewLabelImage.translatesAutoresizingMaskIntoConstraints = false
        DetailCollectionViewLabelImage.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        DetailCollectionViewLabelImage.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
    }
    private func addTextViewImageConstrains() {
        addSubview(DetailCollectionViewTextviewsImage)
        DetailCollectionViewTextviewsImage.translatesAutoresizingMaskIntoConstraints = false
        DetailCollectionViewTextviewsImage.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        DetailCollectionViewTextviewsImage.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
    }
    private func addLabelConstrains() {
        addSubview(DetailTitleLabel)
        DetailTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        DetailTitleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        DetailTitleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        DetailTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        DetailTitleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
    }
    private func addTexviewsConstrains() {
        addSubview(DetailCellTextViewOne)
        DetailCellTextViewOne.translatesAutoresizingMaskIntoConstraints = false
        DetailCellTextViewOne.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        DetailCellTextViewOne.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -50).isActive = true
        DetailCellTextViewOne.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.3).isActive = true
        DetailCellTextViewOne.heightAnchor.constraint(equalToConstant: 200)
        addSubview(DetailCellTextViewTwo)
        DetailCellTextViewTwo.translatesAutoresizingMaskIntoConstraints = false
        DetailCellTextViewTwo.centerXAnchor.constraint(equalTo: DetailCellTextViewOne.centerXAnchor).isActive = true
        DetailCellTextViewTwo.topAnchor.constraint(equalTo: DetailCellTextViewOne.bottomAnchor, constant: 20).isActive = true
        DetailCellTextViewTwo.widthAnchor.constraint(equalTo: DetailCellTextViewOne.widthAnchor).isActive = true
        DetailCellTextViewTwo.heightAnchor.constraint(lessThanOrEqualTo: DetailCellTextViewOne.heightAnchor).isActive = true
    }
    
    
    
    
    
    
}
