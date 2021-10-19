//
//  Question.swift
//  Quiz
//
//  Created by Nate Vardell on 10/18/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let text: String // Question
    let answer: String // Answer
    init(q:String, a:String) {
        text = q
        answer = a
    }
}
