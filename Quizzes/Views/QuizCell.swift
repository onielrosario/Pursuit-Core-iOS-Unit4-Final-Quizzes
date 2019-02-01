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
    
    lazy var quizCollectionViewTextviewsImage: UIImageView = {
        let imageview = UIImageView()
        backgroundColor = .white
        return imageview
    }()
    
    lazy var QuizCellTextViewOne: UITextView = {
        let myTextView = UITextView()
        myTextView.textColor = .white
        myTextView.backgroundColor = .gray
        myTextView.textAlignment = .center
        myTextView.text = "Facts #1..."
        myTextView.isEditable = false
        myTextView.isSelectable = false
        return myTextView
    }()
    
    lazy var QuizCellTextViewTwo: UITextView = {
        let myTextView = UITextView()
        myTextView.textColor = .black
        myTextView.textAlignment = .center
        myTextView.text = "Facts #2..."
        myTextView.isEditable = false
        myTextView.isSelectable = false
        return myTextView
    }()
    
    lazy var quizTitleLabel: UILabel = {
        let mylabel = UILabel()
        mylabel.textAlignment = .center
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
       fatalError("init(coder:) has not been implemented")
    }
    
    
    private func commonInit() {
        addImageConstrains()
        addTextViewImageConstrains()
        addLabelConstrains()
        addTexviewsConstrains()
    }
    
    private func addImageConstrains() {
        addSubview(quizCollectionViewLabelImage)
        quizCollectionViewLabelImage.translatesAutoresizingMaskIntoConstraints = false
        quizCollectionViewLabelImage.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        quizCollectionViewLabelImage.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
    }
    
    private func addTextViewImageConstrains() {
    addSubview(quizCollectionViewTextviewsImage)
        quizCollectionViewTextviewsImage.translatesAutoresizingMaskIntoConstraints = false
        quizCollectionViewTextviewsImage.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        quizCollectionViewTextviewsImage.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
    }
    
    private func addLabelConstrains() {
        addSubview(quizTitleLabel)
        quizTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        quizTitleLabel.centerXAnchor.constraint(equalTo: quizCollectionViewLabelImage.centerXAnchor).isActive = true
        quizTitleLabel.centerYAnchor.constraint(equalTo: quizCollectionViewLabelImage.centerYAnchor).isActive = true
    }
    
    private func addTexviewsConstrains() {
        addSubview(QuizCellTextViewOne)
        QuizCellTextViewOne.translatesAutoresizingMaskIntoConstraints = false
        QuizCellTextViewOne.centerXAnchor.constraint(equalTo: quizCollectionViewTextviewsImage.centerXAnchor).isActive = true
        QuizCellTextViewOne.centerYAnchor.constraint(equalTo: quizCollectionViewTextviewsImage.centerYAnchor, constant: -50).isActive = true
        QuizCellTextViewOne.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.3).isActive = true
        QuizCellTextViewOne.heightAnchor.constraint(equalToConstant: 200)
        addSubview(QuizCellTextViewTwo)
        QuizCellTextViewTwo.translatesAutoresizingMaskIntoConstraints = false
        QuizCellTextViewTwo.centerXAnchor.constraint(equalTo: QuizCellTextViewOne.centerXAnchor).isActive = true
        QuizCellTextViewTwo.topAnchor.constraint(equalTo: QuizCellTextViewOne.bottomAnchor, constant: 20).isActive = true
        QuizCellTextViewTwo.widthAnchor.constraint(equalTo: QuizCellTextViewOne.widthAnchor).isActive = true
        QuizCellTextViewTwo.heightAnchor.constraint(lessThanOrEqualTo: QuizCellTextViewOne.heightAnchor).isActive = true
    }
    
    

}

