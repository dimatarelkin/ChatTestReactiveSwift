//
//  UIViewController+ShowAlert.swift
//  MyChat
//
//  Created by Dmitriy Tarelkin on 30/11/18.
//  Copyright © 2018 Dmitriy Tarelkin. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    /**
     Showing alert with title and message.
     */
    
    func showAlertWithTitle(_ title: String?, message: String?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
}
