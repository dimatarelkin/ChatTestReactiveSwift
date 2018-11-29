//
//  User.swift
//  MyChat
//
//  Created by Dmitriy Tarelkin on 23/11/18.
//  Copyright © 2018 Dmitriy Tarelkin. All rights reserved.
//

import Foundation

class User {
    
    enum UserType {
        case CurrentUser
        case OtherUser
    }
    
    var userID: String?
    var conversationID: String?
    var firstName: String
    var lastName: String
    
    
    //initials
    var initials: String {
        guard let shortFirtsLetterName = self.firstName.first ,
              let shortFirtsLetterLasttName = self.lastName.first  else { return "NN"}
        
        let initials = "\(String(shortFirtsLetterName).capitalized)\(String(shortFirtsLetterLasttName).capitalized)"
        return initials
    }
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName  = lastName
    }
}
