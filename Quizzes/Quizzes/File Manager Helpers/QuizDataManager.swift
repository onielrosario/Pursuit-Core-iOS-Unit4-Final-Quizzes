//
//  QuizDataManager.swift
//  Quizzes
//
//  Created by Oniel Rosario on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation


final class QuizDataManager {
    private init() {}
    private static let filename = "Quizes.plist"
    static func getQuizesFromDocumentsDirectory() -> [QuizFile] {
        var quizes = [QuizFile]()
        let path = DataPersistenceManager.filepathToDocumentsDiretory(filename: filename).path
        if FileManager.default.fileExists(atPath: path) {
            if let data = FileManager.default.contents(atPath: path) {
                do {
                    quizes = try PropertyListDecoder().decode([QuizFile].self, from: data)
                } catch {
                    print("property list does not exist")
                }
            } else {
                print("data is nil")
            }
        } else {
            print("\(filename) does not exist")
        }
        return quizes
    }
    static func saveQuizesToDocumentsDirectory(newQuiz: QuizFile) -> (success: Bool, error: Error?) {
        var collectionQuiz = getQuizesFromDocumentsDirectory()
        collectionQuiz.append(newQuiz)
        let path = DataPersistenceManager.filepathToDocumentsDiretory(filename: filename)
        do {
            let data = try PropertyListEncoder().encode(collectionQuiz)
            try data.write(to: path, options: Data.WritingOptions.atomic)
            
        } catch {
            print("property list encoding error: \(error)")
            return(false, error)
        }
        return (true, nil)
    }
    static func delete(quiz: QuizFile ,atindex index: Int) {
        var quizes = getQuizesFromDocumentsDirectory()
        quizes.remove(at: index)
        let path = DataPersistenceManager.filepathToDocumentsDiretory(filename: filename)
        do {
            let data = try PropertyListEncoder().encode(quizes)
            try data.write(to: path, options: Data.WritingOptions.atomic)
        } catch {
            print("property list encoding error: \(error)")
        }
    }
    static public func isSame(id: String) -> Bool {
        let index = getQuizesFromDocumentsDirectory().index{$0.id == id}
        var found = false
        if let _ = index {
            found = true
        }
        return found
    }
}
