//
//  StructExample.swift
//  StructsVsClasses
//
//  Created by Nate Vardell on 12/4/21.
//

import Foundation

struct StructHero {
    var name: String
    var universe: String
    
    mutating func reverseName() {
        self.name = String(self.name.reversed())
    }
}
//let structHero = StructHero(name: "Ironman", universe: "Marvel")
