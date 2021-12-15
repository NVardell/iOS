//
//  ViewController.swift
//  Temp
//
//  Created by Nate Vardell on 12/15/21.
//

import UIKit

class ViewController: UIViewController {

    var nate: Person?
    var tilda: MacBook?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initEverything()
        deInitEverything()
        initEverything()
        buyTilda()
        deInitEverything()
    }
    
    func deInitEverything() {
        print("\n\nDeInitializing Our Laptop and Person Objects.")
        nate=nil; tilda=nil
        printOurObjects()
    }
    func initEverything() {
        print("\n\nInitializing both of our objects magically!")
        nate = Person(name: "Nate", macBook: nil)
        tilda = MacBook(name: "Matilda", owner: nil)
        printOurObjects()
    }
    func buyTilda() {
        print("\n\nPurchasing Matilda! Yippee!")
        nate?.macBook = tilda
        tilda?.owner = nate
        printOurObjects()
    }
    func printOurObjects() {
        print("Attempting to Print our Objects!")
        print("\tNate: \n\t\t\(String(describing: nate?.name))\t\(String(describing: nate?.macBook?.name))")
        print("\tTilda: \n\t\t\(String(describing: tilda?.name))\t\(String(describing: tilda?.owner?.name))")
    }
}

