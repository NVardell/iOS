//
//  ChatViewController.swift
//  FlashyChat
//
//  Created by Nate Vardell on 11/2/21.
//

import UIKit
import Firebase

class ChatViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    
    var messages: [Message] = [
        Message(sender: "Aziz", body: "Blah, blah, blah!"),
        Message(sender: "Michael", body: "Read receipt."),
        Message(sender: "Aziz", body: "I see, it say, you saw! Blah, blah, blah! Better see more than a 'Read 1 second ago.' in a minute here!!! Gr."),
        Message(sender: "Michael", body: "Read receipt.")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
        navigationItem.hidesBackButton = true
        title = K.appName
    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
    }
    
    @IBAction func logOutPressed(_ sender: UIBarButtonItem) {
        do {
            try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
}



// MARK: - UITableViewDataSource
extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(messages.count)
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("Table View ~ Cell for Row At: \(indexPath.row)")
        return horizontalFlipTableViewRow(cellForRowAt: indexPath)
    }
    
    /**
     * Quick & dirty solution to making chat messages appear on opposing sides dependant on sender.
     *
     * - Parameter indexPath: Row index of table view
     * - Returns: MessageCell for displaying in table view
     */
    func horizontalFlipTableViewRow(cellForRowAt indexPath: IndexPath) -> MessageCell {
        let message = messages[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! MessageCell
        
        if message.sender != "Aziz" {
            cell.transform = CGAffineTransform(scaleX: -1, y: 1)
            cell.messageBubble.transform = CGAffineTransform(scaleX: -1, y: 1)
            cell.rightImageView.transform = CGAffineTransform(scaleX: -1, y: 1)
        }
        
        cell.messageLabel.text = message.body
        
        return cell
    }
}
