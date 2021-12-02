//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var story = StoryBrain()
    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        storyLabel.text = story.getPath()
        choice1Button.setTitle(story.getChoiceOne(), for: .normal)
        choice2Button.setTitle(story.getChoiceTwo(), for: .normal)
    }

    @IBAction func choiceMade(_ sender: UIButton) {
        
    }
    
}

