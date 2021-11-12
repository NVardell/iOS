//
//  StoryBrain.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation


struct StoryBrain {
    
    var currentPath = 0
    
    let path = [
        Story(s: "You see a fork in the road...", c1: "Turn left.", c2: "Turn right.")
    ]
    
    func getPath() -> String {
        return path[currentPath].story
    }
    func getChoiceOne() -> String {
        return path[currentPath].choice1
    }
    func getChoiceTwo() -> String {
        return path[currentPath].choice2
    }
}
