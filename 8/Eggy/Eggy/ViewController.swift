//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let eggTimes = ["Soft":5, "Medium":7, "Hard":12]
    
    var timer = Timer()
    var secondsPassed = 0, totalSeconds = 0
    
    @IBOutlet weak var timerValue: UIView!
    @IBOutlet weak var doneLabel: UILabel!
    @IBOutlet weak var progBar: UIProgressView!
    
    
    @IBAction func hardenessSelected(_ sender: UIButton) {
        
        let hardness = sender.currentTitle!
        totalSeconds = eggTimes[hardness]!
        
        progBar.progress = 0.0
        secondsPassed = 0
        doneLabel.text = "Timer started for cooking a \(hardness) egg!"

        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1.0,
                             target: self,
                             selector: #selector(update),
                             userInfo: nil,
                             repeats: true)
    }

    @objc func update() {
        progBar.progress = Float(secondsPassed) / Float(totalSeconds)
        if secondsPassed < totalSeconds {
            secondsPassed += 1
        } else {
            timer.invalidate()
            doneLabel.text = "Done."
        }
        
    }

}
