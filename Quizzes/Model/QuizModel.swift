//
//  QuizModel.swift
//  Quizzes
//
//  Created by Oniel Rosario on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation
struct Quiz: Codable {
    let id: String
    let quizTitle: String
    let facts: [String]
}

