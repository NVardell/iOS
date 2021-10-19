//
//  Sotry.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

struct Story {
    let story:String
    let choice1:String
    let choice2:String
    init(s:String, c1:String, c2:String) {
        story=s
        choice1=c1
        choice2=c2
    }
}
