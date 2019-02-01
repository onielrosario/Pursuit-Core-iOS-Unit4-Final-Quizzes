//
//  QuizAPIClient.swift
//  Quizzes
//
//  Created by Oniel Rosario on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation




final class quizAPIClient {
    static func getWeather(completionHandler: @escaping (AppError?, [Quiz]?) -> Void) {
        NetworkHelper.shared.performDataTask(endpointURLString: "http://5c4d4c0d0de08100147c59b5.mockapi.io/api/v1/quizzes", httpMethod: "GET", httpBody: nil) { (appError, data) in
            if let appError = appError {
                completionHandler(appError, nil)
            }
            if let data = data {
                do {
                    let quiz = try JSONDecoder().decode([Quiz].self, from: data)
                    completionHandler(nil , quiz)
                } catch {
                }
            }
        }
    }
}
