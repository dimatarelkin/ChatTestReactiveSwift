//
//  ChatViewController.swift
//  MyChat
//
//  Created by Dmitriy Tarelkin on 23/11/18.
//  Copyright © 2018 Dmitriy Tarelkin. All rights reserved.
//

import UIKit


class ChatViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var inputMessageTextField: InteractiveTextField!
    @IBOutlet weak var sendMessageButton: UIButton!
    @IBOutlet weak var changabelConstraint: NSLayoutConstraint!
    
    var dataSource: Array<Message> = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //delegates
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        //setup views
        self.setupViews()
        self.registerForKeyboardNotifications()
        
        //registering cells
        self.collectionView.register(UINib.init(nibName: kCurrentUserChatCellNibName, bundle: Bundle.main), forCellWithReuseIdentifier: kCurrentUserCellIdentifier)
        
        self.collectionView.register(UINib.init(nibName: kOtherUserChatCellNibName, bundle: Bundle.main), forCellWithReuseIdentifier: kOtherUserCellIdentifier)
        
        //collection view
        self.collectionView.contentInset = UIEdgeInsets(top: 15.0, left: 0.0, bottom: 15.0, right: 0.0)
    }
    
    
    func setupViews(){
        let cornerRadius = sendMessageButton.bounds.width / 2
        self.sendMessageButton.layer.cornerRadius = cornerRadius
        self.inputMessageTextField.layer.cornerRadius = cornerRadius
        self.inputMessageTextField.layer.borderWidth = 3
        self.inputMessageTextField.layer.borderColor = UIColor(red: 171/255.0, green: 171/255.0, blue: 171/255.0, alpha: 0.4).cgColor
    }
    
    
    //MARK: Action
    
    @IBAction func sendMessageActionHandler(_ sender: Any) {
        self.view.endEditing(false)
        guard let message = self.inputMessageTextField.text, message != "" else {return}
        
        //////////////
        let randomCelltype = arc4random()
        var type: Message.MessageType
        
        if randomCelltype % 2 == 0 {
            type = .MessageFromCurentUser
        } else {
            type = .MessaheFromOtherUser
        }
        ///////////////////////
        
        let mes = Message(text: message, sender: User(firstName: "Dima", lastName: "Tarelkin"), messageType: type)
        
        self.dataSource.append(mes)
        
        //reload data
        self.collectionView.reloadData()
        self.inputMessageTextField.text = nil

    }
    
    
}




