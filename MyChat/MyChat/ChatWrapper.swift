//
//  ChatWrapper.swift
//  
//
//  Created by Dmitriy Tarelkin on 25/11/18.
//

import Foundation
import ReactiveSwift
import Result

// first part: https://nomothetis.svbtle.com/an-introduction-to-reactivecocoa
//second part: https://nomothetis.svbtle.com/reactivecocoa-ii-reacting-to-signals

//errors
enum LocalStoreError: Error {
    case SomeError(String)
}

enum NetworkError: Error {
    case SomeNetworkError(String)
}

enum RetrievalError: Error {
    case CannotRetrieveFRomDB(LocalStoreError)
    case CannotRetriveFRomNetwork(NetworkError)
}



class ChatWrapper {
    
    //Producer
    static func messageCollectionProducer() -> SignalProducer<[Message], RetrievalError> {
        return SignalProducer({ (signal, lifetime) in
            
            //local messages
            switch ChatWrapper.localMessages() {
            case .success(let messages):
                
                signal.send(value: messages)
                
            case .failure(let someError):
                signal.send(error: RetrievalError.CannotRetrieveFRomDB(someError))
                return
            }
            
            //network messages
            switch ChatWrapper.networkMessages() {
            case .success(let messages):
                signal.send(value: messages)
                signal.sendCompleted()
            case .failure(let networkError):
                signal.send(error: RetrievalError.CannotRetriveFRomNetwork(networkError))
            }
        })
    }
    
    
    
    //creating two producers and concatenating them
    //pipe forward operator |> -- take the thing on the left, and do the thing on the right to it once the signal is started
    //concatenate -- wait until the first one is done, and then start the second one
    
   static func messageCollectionProducerConcatenated() -> SignalProducer<[Message], RetrievalError> {
        
        let localFetchProducer = SignalProducer(result:ChatWrapper.localMessages()).lift { (signal) -> Signal<[Message], LocalStoreError> in
            return signal
            }.mapError { (localError) -> RetrievalError in
                return RetrievalError.CannotRetrieveFRomDB(.SomeError("local error"))
        }
        
        
        let networkFetchProducer = SignalProducer(result:ChatWrapper.networkMessages()).lift { (signal) -> Signal<[Message], NetworkError> in
            return signal
            }.mapError { (networkError) -> RetrievalError in
                return RetrievalError.CannotRetriveFRomNetwork(.SomeNetworkError("network error"))
        }
        
        return localFetchProducer.concat(networkFetchProducer)
    }
    
    
    //local
    private static func localMessages() -> Result<[Message],LocalStoreError> {
        //retrieve messages
        let message = Message(text: "hello from local", sender: User(firstName: "sd", lastName: "sd"), messageType: .MessageFromCurentUser)
        
        return Result([message,message,message], failWith: LocalStoreError.SomeError("someError"))
    }
    
    //network
    private static func networkMessages() -> Result<[Message],NetworkError> {
        //retrieve messages
        
         let message = Message(text: "hello from network", sender: User(firstName: "sd", lastName: "sd"), messageType: .MessageFromCurentUser)
        return Result([message,message,message], failWith: NetworkError.SomeNetworkError("someNetworkError"))
    }
}
