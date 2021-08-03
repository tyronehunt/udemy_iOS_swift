//
//  Question.swift
//  Quizzler-iOS13

import Foundation

// Multiple Choice Question
struct Question {
    let text: String
    let answers: [String]
    let rightAnswer: String

    init(q: String, a: [String], correctAnswer: String) {
        text = q
        answers = a
        rightAnswer = correctAnswer
    }
}


// With Boolean Question:
//struct Question {
//    let text: String
//    let answer: String
//
//    init(q: String, a: String) {
//        text = q
//        answer = a
//    }
//}
