//
//  QuizModel.swift
//  Quizzes
//
//  Created by Oniel Rosario on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation



struct QuizModel: Codable {
    let quiz: Quiz
}

struct Quiz: Codable {
    let id: String
    let quizTitle: String
    let facts: [Facts]
}

struct Facts: Codable {
    let facts: [String]
}
