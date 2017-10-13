//
//  MessageCell.swift
//  devslopes-chat
//
//  Created by Jean-François Droux on 29.09.17.
//  Copyright © 2017 Droux. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {
    
    
    @IBOutlet weak var messageLabel: UILabel!
    
    @IBOutlet weak var userLabel: UILabel!
    
    func configureCell(user: String, message: String) {
        userLabel.text = user
        messageLabel.text = message
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
