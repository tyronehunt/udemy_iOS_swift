//  ViewController.swift
//  Quizzler-iOS13

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    // Initiate Model
    var quizBrain = QuizBrain()
    
    // Connect UI update function to view
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    // Button Functionality
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle! //True, False
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
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
    }
    
}

