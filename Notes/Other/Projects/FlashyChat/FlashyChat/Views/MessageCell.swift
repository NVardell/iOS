//
//  MessageCell.swift
//  FlashyChat
//
//  Created by Nate Vardell on 11/3/21.
//

import UIKit

class MessageCell: UITableViewCell {

    @IBOutlet weak var messageBubble: UIView!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var rightImageView: UIImageView!
    @IBOutlet weak var leftImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code: Called for every row in Table View
        // Make Message Bubble have rounded courners
        //      - Not static radius for long winded messages with larger height values
        messageBubble.layer.cornerRadius = messageBubble.frame.size.height / 5
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
