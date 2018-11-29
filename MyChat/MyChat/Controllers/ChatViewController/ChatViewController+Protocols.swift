//
//  ChatViewController+Protocols.swift
//  MyChat
//
//  Created by Dmitriy Tarelkin on 29/11/18.
//  Copyright © 2018 Dmitriy Tarelkin. All rights reserved.
//

import Foundation
import ReactiveSwift
import Result



protocol ChatObserveProtocol {
    var observer: Signal<[Message], RetrievalError>.Observer { get }
    var disposable: Disposable { get }
}
