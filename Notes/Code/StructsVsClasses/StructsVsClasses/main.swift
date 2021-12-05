//
//  main.swift
//  StructsVsClasses
//
//  Created by Nate Vardell on 12/4/21.
//

import Foundation

let classHero = ClassHero(name: "Iron Man", universe: "Marvel")
let structHero = StructHero(name: "Iron Man", universe: "Marvel")


/**
 * Example ~ Classes pass by reference
 */
var anotherHero = classHero
anotherHero.name =  "The Hulk"

var avengers = [classHero, anotherHero]
avengers[0].name = "Thor"

print("Hero Name = \(classHero.name)")              // Thor
print("AnotherHero Name = \(anotherHero.name)")     // Thor
print("First Avenger Name = \(avengers[0].name)")   // Thor



/**
 * Example ~ Structs maintain Immutability down to the properties, unlike Classes.
 */
// Allowed
classHero.name = "Black Widow"
// Not allowed
// structHero.name = "Black Widow"
// print(structHero.reverseName())

