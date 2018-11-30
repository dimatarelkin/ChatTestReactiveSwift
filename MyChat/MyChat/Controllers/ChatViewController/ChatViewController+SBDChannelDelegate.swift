//
//  ChatViewController+SBDChannelDelegate.swift
//  MyChat
//
//  Created by Dmitriy Tarelkin on 29/11/18.
//  Copyright © 2018 Dmitriy Tarelkin. All rights reserved.
//

import Foundation
import UIKit
import ReactiveSwift
import Result
import SendBirdSDK

extension ChatViewController: SBDChannelDelegate {
    
    
    func channel(_ sender: SBDBaseChannel, didReceive message: SBDBaseMessage) {

        let usermessage = message as? SBDUserMessage
        let mess = Message(text: usermessage?.message ?? "no data", sender: User(firstName: "sdfjksd", lastName: "fdfjkkj"), messageType: .MessageFromOtherUser)
        
        print(mess.text)
        
        self.observer.send(value: [mess])
    }
}


