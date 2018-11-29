//
//  Service.swift
//  MyChat
//
//  Created by Dmitriy Tarelkin on 23/11/18.
//  Copyright © 2018 Dmitriy Tarelkin. All rights reserved.
//

import Foundation
import SendBirdSDK


class Service {
    static var currentUser: SBDUser?
    
    func sendMessage() {}
    
    func retrieveAllMessages() {}
    
    func recieveMessage() {}
    ////////\
    
    //create channel
    static func createChannel() {
        SBDOpenChannel.createChannel { (channel, error) in
            guard error == nil else {    // Error.
                return
            }
        }
    }
    
    func getTheChannel() {
        SBDOpenChannel.getWithUrl("CHANNEL_URL") { (channel, error) in
            guard error == nil else {    // Error.
                return
            }
            
            channel?.enter(completionHandler: { (error) in
                guard error == nil else {    // Error.
                    return
                }
            })
        }
    }
    
    
    
    
}
