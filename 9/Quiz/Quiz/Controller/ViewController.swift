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
    
    var quizBrain = QuizBrain()
    
    
    /**
     * Triggered on initial app load
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        
        quizBrain.totalQuestions = quizBrain.quiz.count
        questionLabel.text = quizBrain.quiz[quizBrain.currentQuestion].text
        progressBar.progress = Float(quizBrain.completedQuestions) / Float(quizBrain.totalQuestions)
    }
    
    
    /**
     * Triggered any time an answer button is pressed.
     */
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let answer = sender.currentTitle!
        
        if quizBrain.checkAnswer(answer) {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
     
        Timer.scheduledTimer(timeInterval: 0.2,
                                     target: self,
                                     selector: #selector(updateUI),
                                     userInfo: nil,
                                     repeats: false)
    }
    
    @objc func updateUI() {
        
        // Forces an infinite loop of the quiz questions
        if quizBrain.currentQuestion < quizBrain.totalQuestions-1 {
            quizBrain.currentQuestion+=1
        } else {
            quizBrain.currentQuestion = 0
            quizBrain.completedQuestions = -1
        }
        
        quizBrain.completedQuestions+=1
        questionLabel.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
    }

}

