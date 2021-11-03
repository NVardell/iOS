//
//  WelcomeViewController.swift
//  FlashyChat
//
//  Created by Nate Vardell on 11/2/21.
//

import UIKit
//import CLTypingLabel

class WelcomeViewController: UIViewController {

    let titleText = "⚡️FlashChat"
    
    @IBOutlet weak var titleLabel: CLTypingLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = "⚡️FlashChat"
    }
    

}
