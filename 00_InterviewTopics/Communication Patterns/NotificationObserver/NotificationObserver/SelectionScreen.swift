//
//  SelectionScreen.swift
//  NotificationObserver
//
//  Created by Nate Vardell on 12/13/21.
//

import UIKit

/// Screen we will be using to post our notifications
class SelectionScreen: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func imperialButtonTapped(_ sender: UIButton) {
        let name = Notification.Name(rawValue: darkNotificationKey)
        NotificationCenter.default.post(name: name, object: nil)
        dismiss(animated: true, completion: nil)
    }

    @IBAction func rebelButtonTapped(_ sender: UIButton) {
        let name = Notification.Name(rawValue: lightNotificationKey)
        NotificationCenter.default.post(name: name, object: nil)
        dismiss(animated: true, completion: nil)
    }
}
