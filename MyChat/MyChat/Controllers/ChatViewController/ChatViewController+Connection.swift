//
//  ChatViewController+Connection.swift
//  MyChat
//
//  Created by Dmitriy Tarelkin on 30/11/18.
//  Copyright © 2018 Dmitriy Tarelkin. All rights reserved.
//

import Foundation
import SendBirdSDK


extension ChatViewController {
    
    func connect() {
        SBDOpenChannel.getWithUrl(self.channelID) { [weak self] (channel, error) in
            guard error == nil, let channel = channel else {
                self?.showAlertWithTitle("Error", message: "Can't fetch the chat")
                return
            }
            print(channel.description)
            self?.channel = channel
            
            channel.enter(completionHandler: { (error) in
                guard error == nil else {
                    self?.showAlertWithTitle("Error", message: "Can't enter the chat")
                    return
                }
                guard let strongSelf = self else {return}
                
                SBDMain.add(strongSelf as SBDChannelDelegate, identifier: strongSelf.channelID)
                strongSelf.loadpreviousMessages()
            })
        }
    }
    
    
    func loadpreviousMessages() {
        let previousMessageQuery = self.channel?.createPreviousMessageListQuery()
        
        previousMessageQuery?.loadPreviousMessages(withLimit: 30, reverse: true, completionHandler: { (messages, error) in
            guard error == nil else {    // Error.
                return
            }
            
            messages?.forEach({ (message) in
            
//                print(message.description)
                print(message.getMetaArray(withKeys: ["Message"]).description)
            })
        })
    }
    
}
