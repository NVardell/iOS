//
//  ViewController.swift
//  PanGesture
//
//  Created by Nate Vardell on 12/15/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var fileImageView: UIImageView!
    @IBOutlet weak var trashImageView: UIImageView!
    
    var fileViewOrigin: CGPoint!  // Icon frame reference for reset
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add Pan Gesture to our File Image
        addPanGesture(view: fileImageView)
        
        // Set location of File Icon on screen
        fileViewOrigin = fileImageView.frame.origin
        
        // Forces File Icon to appear above trash icon
        view.bringSubviewToFront(fileImageView)
    }

    
    /// Gesture | Add Pan Gesture to view
    func addPanGesture(view: UIView) {
        let pan = UIPanGestureRecognizer(target: self, action: #selector(ViewController.handlePan(sender:)))
        view.addGestureRecognizer(pan)
    }

    
    /// Gesture | Handle Image Pan Gesture
    @objc func handlePan(sender: UIPanGestureRecognizer) {
        // Sender being our pan gesture that is attached to file image (L28)
        let fileView = sender.view!
        
        switch sender.state {
            case .began, .changed:
                moveViewWithPan(view: fileView, sender: sender)
            case .ended:
                // Check if File Icon Overlaps our Trash Icon
                if fileView.frame.intersects(trashImageView.frame) {
                    UIView.animate(withDuration: 0.3) {
                        self.fileImageView.alpha = 0.0
                    }
                    // Remove File Icon from View
                } else {
                    UIView.animate(withDuration: 0.3) {
                        self.fileImageView.frame.origin = self.fileViewOrigin
                    }
                    // Move File Icon back to Origin
                }
            default:
                print("Default Case")
        }
    }
    
    
    /// Pan | Helper Methods
    func moveViewWithPan(view: UIView, sender: UIPanGestureRecognizer) {
        let trans = sender.translation(in: view)
        
        view.center = CGPoint(
            x: view.center.x + trans.x,
            y: view.center.y + trans.y)
        
        sender.setTranslation(CGPoint.zero, in: view)
    }
}

