//
//  BaseScreen.swift
//  NotificationObserver
//
//  Created by Nate Vardell on 12/13/21.
//

import UIKit

/// Unique Identifiers for our Notifications
let lightNotificationKey = "lightSide"
let darkNotificationKey = "darkSide"

class BaseScreen: UIViewController {

    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var chooseButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chooseButton.layer.cornerRadius = chooseButton.frame.size.height/2
    }
    
    
    /// Our Notifications
    let light = Notification.Name(rawValue: lightNotificationKey)
    let dark = Notification.Name(rawValue: darkNotificationKey)
    
    
    /// Remove Observers ~ De-Initialize
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    /// Button Pressed UIAction
    @IBAction func chooseButtonTapped(_ sender: UIButton) {
        let selectionVC = storyboard?.instantiateViewController(withIdentifier: "SelectionScreen") as! SelectionScreen
        present(selectionVC, animated: true, completion: nil)
    }
    
    
    /// Create our observers to wait on notifications triggered by our Selection Screen
    func createObservers() {
        // Light Side
        NotificationCenter.default.addObserver(self, selector: #selector(BaseScreen.updateCharacterImage(notification:)), name: light, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(BaseScreen.updateCharacterName(notification:)), name: light, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(BaseScreen.updateBackground(notification:)), name: light, object: nil)
        
        // Dark Side
        NotificationCenter.default.addObserver(self, selector: #selector(BaseScreen.updateCharacterImage(notification:)), name: dark, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(BaseScreen.updateCharacterName(notification:)), name: dark, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(BaseScreen.updateBackground(notification:)), name: dark, object: nil)
    }
    
    /// Update our UI based on the notifications our Observers receive
    @objc func updateCharacterImage(notification: NSNotification) {
        
        let isLight = notification.name == light
    
        // What Side?
        let image = isLight ? UIImage(named: "luke")! : UIImage(named: "vader")!
        
        // Set Image
        mainImageView.image = image
    }
    @objc func updateCharacterName(notification: NSNotification) {
        let isLight = notification.name == light
        
        // What Side?
        let characterName = isLight ? "Luke" : "Darth Vader"
        
        // Set Name On UI
        nameLabel.text = characterName
    }
    @objc func updateBackground(notification: NSNotification) {
        let isLight = notification.name == light
        
        // What Side?
        let backgroundColor = isLight ? UIColor.cyan : UIColor.red
        
        // Set Background On UI
        view.backgroundColor = backgroundColor
    }
}
