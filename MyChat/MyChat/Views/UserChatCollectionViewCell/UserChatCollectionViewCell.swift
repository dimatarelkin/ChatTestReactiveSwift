//
//  CurrentUserChatCollectionViewCell.swift
//  MyChat
//
//  Created by Dmitriy Tarelkin on 24/11/18.
//  Copyright © 2018 Dmitriy Tarelkin. All rights reserved.
//

import UIKit

class UserChatCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var userLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.setupViews()
    }
    
    private func setupViews() {
        self.messageLabel.clipsToBounds = true
        self.userLabel.clipsToBounds = true
        self.messageLabel.layer.cornerRadius = 15
        self.userLabel.layer.cornerRadius = 20
    }
    
    
    func configureCellWithUser(message: Message) {
        self.userLabel.text = message.sender.initials
        self.messageLabel.text = message.text
    }

}
