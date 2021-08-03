//  ViewController.swift
//  Quizzler-iOS13

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var choice1: UIButton!
    @IBOutlet weak var choice2: UIButton!
    @IBOutlet weak var choice3: UIButton!
    

    
    // Initiate Model
    var quizBrain = QuizBrain()
    
    // Connect UI update function to view
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    // Button Functionality
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        // Keep track of question
        quizBrain.nextQuestion()
        
        // Wait for color to show before moving on
        Timer.scheduledTimer(timeInterval: 0.20, target:self, selector: #selector(updateUI), userInfo:nil, repeats: false)
        
        }
    
    // Update UI properties
    @objc func updateUI() {
        questionLabel.text = quizBrain.getQuestionText()
        
        // Update Answer options
        let answerChoices = quizBrain.getAnswers()
        choice1.setTitle(answerChoices[0], for: .normal)
        choice2.setTitle(answerChoices[1], for: .normal)
        choice3.setTitle(answerChoices[2], for: .normal)
        
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        
        choice1.backgroundColor = UIColor.clear
        choice2.backgroundColor = UIColor.clear
        choice3.backgroundColor = UIColor.clear
    }
    
}

