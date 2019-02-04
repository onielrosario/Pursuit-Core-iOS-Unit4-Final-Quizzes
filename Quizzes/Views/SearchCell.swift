//
//  SearchCell.swift
//  Quizzes
//
//  Created by Oniel Rosario on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

protocol SearchCellDelegate: AnyObject {
    func updateQuizes(getQuizes: [QuizFile])
    func saveQuiz()
}

protocol SearchAlertDelegate: AnyObject {
    func alert()
}

class SearchCell: UICollectionViewCell {
    weak var searchCellDelegate: SearchCellDelegate?
    lazy var SearchCellButton: UIButton = {
        let myButton = UIButton()
        myButton.setImage(UIImage(named: "add"), for: .normal)
        myButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return myButton
    }()
    lazy var searchQuizLabel: UILabel = {
        let mylabel = UILabel()
        mylabel.textAlignment = .center
        mylabel.numberOfLines = 3
        mylabel.text = "Quiz title..."
        mylabel.textColor = .black
        return mylabel
    }()
    @objc private func buttonPressed() {
        self.searchCellDelegate?.updateQuizes(getQuizes: QuizDataManager.getQuizesFromDocumentsDirectory())
        self.searchCellDelegate?.saveQuiz()
    }
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        backgroundColor = .white
        setConstrains()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setConstrains() {
        buttonConstrains()
        labelContrains()
    }
    private func buttonConstrains() {
        addSubview(SearchCellButton)
        SearchCellButton.translatesAutoresizingMaskIntoConstraints = false
        SearchCellButton.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        SearchCellButton.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        SearchCellButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        SearchCellButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
    }
    private func labelContrains() {
        addSubview(searchQuizLabel)
        searchQuizLabel.translatesAutoresizingMaskIntoConstraints = false
        searchQuizLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        searchQuizLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        searchQuizLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        searchQuizLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
    }
}
