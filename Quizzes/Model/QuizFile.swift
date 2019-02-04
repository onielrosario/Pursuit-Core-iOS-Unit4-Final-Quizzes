//
//  QuizFile.swift
//  Quizzes
//
//  Created by Oniel Rosario on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation
struct QuizFile: Codable {
    let id: String
    let name: String
    let facts: [String]
    let dateAdded: String
}
