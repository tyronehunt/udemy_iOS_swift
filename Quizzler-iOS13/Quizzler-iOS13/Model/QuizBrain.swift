//
//  QuizBrain.swift
//  Quizzler-iOS13

import Foundation

struct QuizBrain {
    
    // Set questions and answers
    let quiz = [
        Question(q: "Which is the largest organ in the human body?", a: ["Heart", "Skin", "Large Intestine"], correctAnswer: "Skin"),
        Question(q: "Five dollars is worth how many nickels?", a: ["25", "50", "100"], correctAnswer: "100"),
        Question(q: "What do the letters in the GMT time zone stand for?", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], correctAnswer: "Greenwich Mean Time"),
        Question(q: "What is the French word for 'hat'?", a: ["Chapeau", "Écharpe", "Bonnet"], correctAnswer: "Chapeau"),
        Question(q: "In past times, what would a gentleman keep in his fob pocket?", a: ["Notebook", "Handkerchief", "Watch"], correctAnswer: "Watch"),
        Question(q: "How would one say goodbye in Spanish?", a: ["Au Revoir", "Adiós", "Salir"], correctAnswer: "Adiós"),
        Question(q: "Which of these colours is NOT featured in the logo for Google?", a: ["Green", "Orange", "Blue"], correctAnswer: "Orange"),
        Question(q: "What alcoholic drink is made from molasses?", a: ["Rum", "Whisky", "Gin"], correctAnswer: "Rum"),
        Question(q: "What type of animal was Harambe?", a: ["Panda", "Gorilla", "Crocodile"], correctAnswer: "Gorilla"),
        Question(q: "Where is Tasmania located?", a: ["Indonesia", "Australia", "Scotland"], correctAnswer: "Australia")
    ]
    
    // Keep track of question number
    var questionNumber = 0
    // Keep track of score
    var score = 0
    
    // Check answer (note the external and internal parameter names)
    mutating func checkAnswer(_ userAnswer: String) -> Bool{
        // With boolean question was just answer, now it's rightAnswer
        if userAnswer == quiz[questionNumber].rightAnswer {
            score += 1
            return true
        } else {
            return false
        }
    }
    
    
    // Keep track of score
    func getScore() -> Int {
        return score
    }
    
    
    // Get Question Text
    func getQuestionText() -> String {
        return quiz[questionNumber].text
    }
    
    
    // Fetch the answer choices.
    func getAnswers() -> [String] {
        return quiz[questionNumber].answers
    }
    
    
    // Get Progress
    func getProgress() -> Float {
        let progress = Float(questionNumber) / Float(quiz.count)
        return progress
    }
    
    
    // Get next question (mutating as it is updating the questionNumber variable)
    mutating func nextQuestion() {
        if questionNumber + 1 < quiz.count {
            questionNumber += 1
        } else {
            // Reset questions and score if the app restarts
            questionNumber = 0
            score = 0
        }
    }
    
    
}
