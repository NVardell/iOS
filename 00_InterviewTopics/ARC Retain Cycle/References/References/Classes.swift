//
//  Classes.swift
//  Temp
//
//  Created by Nate Vardell on 12/15/21.
//

import Foundation

class Person {
    let name: String
    var macBook: MacBook?
    
    init(name: String, macBook: MacBook?) {
        print("\tPerson: \(name) is being initialized into existence! Yippee!!!")
        self.name = name; self.macBook = macBook
    }
    deinit {
        print("\tPerson: \(name) is being removed from memory! Dun, dun, dun!!!!!!")
    }
}

class MacBook {
    let name: String
    weak var owner: Person?
    init(name:String, owner:Person?) {
        print("\tMackBook: \(name) the MacBook is being initialized into existence! Yippee!!!")
        self.name = name; self.owner=owner
    }
    deinit {
        print("\tMacBook: \(name) the MacBook is being removed from memory! Dun, dun, dun!!!!!!")
    }
}
