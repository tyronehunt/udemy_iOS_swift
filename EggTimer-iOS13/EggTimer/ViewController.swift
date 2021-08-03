//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    let eggTimes = ["Soft": 300, "Medium": 420, "Hard": 720]
    
    var timer = Timer()
    
    var totalTime = 0
    var secondsPassed = 0
    
    @IBAction func buttonClick(_ sender: UIButton) {
        
        // Required to prevent multiple timer triggers
        timer.invalidate()
        
        // Soft, Medium, Hard Label
        let hardness = sender.currentTitle!
        
        totalTime = eggTimes[hardness]!
        
        progressBar.progress = 0.0
        secondsPassed = 0
        titleLabel.text = hardness
        
        // Call timer update function with a 1 second interval
        timer = Timer.scheduledTimer(timeInterval: 1.0, target:self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
    
    }
    
    // Define function to count down
    @objc func updateTimer() {
        if secondsPassed < totalTime {
            secondsPassed += 1
            
            let percentageProgress = Float(secondsPassed) / Float(totalTime)
            
            progressBar.progress = percentageProgress
            
        } else {
            timer.invalidate()
            titleLabel.text = "Done!"
            playSound(soundTitle: "alarm_sound")
        }
    }
    
    // Play sound function
    func playSound(soundTitle: String) {
        let url = Bundle.main.url(forResource: soundTitle, withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }

}
