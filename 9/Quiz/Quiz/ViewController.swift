//
//  ViewController.swift
//  Quiz App
//
//  Created by Nate V on 10/17/2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    // Maintaining Current & Completed for future randomization of questions
    var totalQuestions = 0, completedQuestions = 0, currentQuestion = 0
    var correct = 0, incorrect = 0
    
    // Base Quiz Array for quick testing
    let quiz = [
        ["Q1","True"],
        ["Q2","True"],
        ["Q3","True"],
        ["Q4","True"],
        ["Q5","True"],
        ["Q6","True"],
        ["Q7","True"],
        ["Q8","True"],
        ["Q9","True"],
        ["Q10","True"]
    ]
    
    /**
     * Triggered on initial app load
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        
        progressBar.progress = 0.0
        
        totalQuestions = quiz.count
        questionLabel.text = quiz[currentQuestion][0]
    }
    
    
    /**
     * Triggered any time an answer button is pressed.
     */
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let answer = sender.currentTitle
        let currentAnswer = quiz[currentQuestion][0]
        
        if(answer == currentAnswer) {
            correct+=1
        } else {
            incorrect+=1
        }
     
        print("Correct=\(correct) \t Incorrect=\(incorrect)")
        updateUI()
    }
    
    func updateUI() {
        
        // Forces an infinite loop of the quiz questions
        if currentQuestion < totalQuestions-1 {
            currentQuestion+=1
        } else {
            currentQuestion = 0
            completedQuestions = -1
        }
        
        completedQuestions+=1
        questionLabel.text = quiz[currentQuestion][0]
        progressBar.progress = Float(completedQuestions) / Float(totalQuestions)
    }

}

