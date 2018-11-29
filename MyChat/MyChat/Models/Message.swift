//
//  Message.swift
//  MyChat
//
//  Created by Dmitriy Tarelkin on 23/11/18.
//  Copyright © 2018 Dmitriy Tarelkin. All rights reserved.
//

import Foundation


class Message {
    
    enum MessageType {
        case MessageFromCurentUser
        case MessaheFromOtherUser
    }
    
    var messageID: String?
    var text: String
    var sender: User
    var messageType: MessageType
    
    init(text: String, sender: User, messageType: MessageType) {
        self.text = text
        self.sender = sender
        self.messageType = messageType
    }
}
