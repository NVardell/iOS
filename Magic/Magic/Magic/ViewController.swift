//
//  ViewController.swift
//  Magic
//
//  Created by Nate Vardell on 10/15/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ballIV: UIImageView!
    let ballArray = [#imageLiteral(resourceName: "ball1"), #imageLiteral(resourceName: "ball2"), #imageLiteral(resourceName: "ball3"), #imageLiteral(resourceName: "ball4"), #imageLiteral(resourceName: "ball5")]
    
    @IBAction func askBtn(_ sender: UIButton) {
        ballIV.image = ballArray.randomElement()
    }
}

