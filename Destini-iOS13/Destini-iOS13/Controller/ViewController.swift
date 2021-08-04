//
//  ViewController.swift
//  Destini-iOS13


import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    
    let story0 = "You see a fork in the road"
    
    let choice1 = "Take a left."
    let choice2 = "Take a right."
    
    @IBAction func choiceMade(_ sender: UIButton) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()

    }
    
    func updateUI() {
        storyLabel.text = story0
    }


}

