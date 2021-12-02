//
//  ChatViewController.swift
//  FlashyChat
//
//  Created by Nate Vardell on 11/2/21.
//

import UIKit
import Firebase
import CoreMedia

class ChatViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    
    
    let db = Firestore.firestore()
    
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
        
        // Grab all messages from Firestore DB
        loadMessages()
    }
    
    
    func loadMessages() {
        // Add Listener to Messages Collection & Trigger on Change
        db.collection(K.FStore.collectionName)
            .order(by: K.FStore.dateField)
            .addSnapshotListener { querySnapshot, error in
            
                self.messages = []
                if let e = error { print("There was an error retrieving data from Firestore. Error: \(e)") }
                else { if let snapDocs = querySnapshot?.documents {
                    for snap in snapDocs {
                        let data = snap.data()
                        if let sender = data[K.FStore.senderField] as? String,
                           let message = data[K.FStore.bodyField] as? String {
                            let newMessage = Message(sender: sender, body: message)
                            self.messages.append(newMessage)
                            
                            // Altering UI inside Closure ~ Need to access Main Queue to do it.
                            DispatchQueue.main.async {
                                self.tableView.reloadData()
                                // Scroll TableView to bottom automatically
                                self.tableView.scrollToRow(at: IndexPath(row: self.messages.count-1, section: 0), at: .top, animated: true)
                            }
                    }
                }
            }}
        }
    }
    
    
    @IBAction func sendPressed(_ sender: UIButton) {
        // If there is a new message,& we have a current User; grab the message they entered & grab their email.
        if let messageBody = messageTextfield.text, let messageSender = Auth.auth().currentUser?.email {
            print("Sender: \(messageSender)\tMessage: \(messageBody)")
            db.collection(K.FStore.collectionName)
                .addDocument(data: [K.FStore.senderField: messageSender,
                                    K.FStore.bodyField: messageBody,
                                    K.FStore.dateField: Date().timeIntervalSince1970]) {
                    (error) in
                        if let e = error { print("There was an issue saving data to firestore. Error: \(e)") }
                        else {
                            print("Database saved succesfully.")
                            
                            DispatchQueue.main.async {
                                self.messageTextfield.text = ""  // Clear out user input from message box
                            }
                        }
                    }
        }
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
        
        let message = messages[indexPath.row]
        let currentUserEmail = Auth.auth().currentUser?.email
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! MessageCell
        cell.messageLabel.text = message.body
        
        // Message from current user ~ Hide left user image
        if message.sender == currentUserEmail {
            cell.leftImageView.isHidden = true
            cell.rightImageView.isHidden = false
            cell.messageBubble.backgroundColor = UIColor(named: K.BrandColors.lightPurple)
            cell.messageLabel.textColor = UIColor(named: K.BrandColors.purple)
        } else {
            cell.leftImageView.isHidden = false
            cell.rightImageView.isHidden = true
            cell.messageBubble.backgroundColor = UIColor(named: K.BrandColors.lighBlue)
            cell.messageLabel.textColor = UIColor(named: K.BrandColors.blue)
        }
        
        return cell
    }
}
