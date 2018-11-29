//
//  ChatViewController+SignalHandling.swift
//  MyChat
//
//  Created by Dmitriy Tarelkin on 29/11/18.
//  Copyright © 2018 Dmitriy Tarelkin. All rights reserved.
//

import Foundation
import UIKit
import ReactiveSwift
import Result


extension ChatViewController: ChatObserveProtocol {
    
    var observer: Signal<[Message], RetrievalError>.Observer {
        return  Signal<[Message], RetrievalError>.Observer(
        value: { (messages) in
//                messages.forEach({ (message) in
//                    print(message.text)
//                })
            self.dataSource.append(contentsOf: messages)
            self.collectionView.reloadData()
            
        }, failed: { (retrievalError) in
            
            print(retrievalError.localizedDescription)
        }, completed: {
            
            print("completed")
        }) {
            print("interapted")
        }
    }
    
    var disposable: Disposable {
        return ChatWrapper.messageCollectionProducer(message: nil).start()
    }
}
