//
//  Channel.swift
//  MyChat
//
//  Created by Dmitriy Tarelkin on 23/11/18.
//  Copyright © 2018 Dmitriy Tarelkin. All rights reserved.
//

import Foundation

class Channel {
    var chatID: String?
    var title: String
    var messages: Array<Message>?
    var users: Array<User>
    
    init(users: Array<User>, title: String) {
        self.users = users
        self.title = title
    }
}
