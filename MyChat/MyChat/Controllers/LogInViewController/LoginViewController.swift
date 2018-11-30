//
//  LoginViewController.swift
//  RealmChat
//
//  Created by Aliaksei Piatyha on 10/30/18.
//

import UIKit
import SendBirdSDK


class LoginViewController: UIViewController {
    
    @IBOutlet weak var loginTextField: InteractiveTextField!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupSubviews()
        self.activityIndicator.isHidden = true
        self.activityIndicator.hidesWhenStopped = true
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func tapGestureRecognized(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    func setupSubviews() {
        self.title = "Welcome"
        self.resultLabel.text = nil
        self.loginTextField.isHidden = false
        self.signInButton.isHidden = false
        
        // Sign In Button
        self.signInButton.layer.cornerRadius = 8
        self.signInButton.layer.masksToBounds = false
        self.signInButton.layer.shadowRadius = 1.0
        self.signInButton.layer.shadowColor = UIColor.lightGray.cgColor
        self.signInButton.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        self.signInButton.layer.shadowOpacity = 15.0
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    
    @IBAction func signInActionHandler(_ sender: UIButton) {
        
        guard let username = loginTextField.text,
            username != "" else {
                self.loginTextField.shake()
                return
        }
        
        //style
        sender.startWaitingState()
        self.activityIndicator.isHidden = false
        self.activityIndicator.startAnimating()
        
        
        SBDMain.connect(withUserId: username) { [weak self] (user, error) in
            //style
            self?.activityIndicator.stopAnimating()
            sender.endWaitingState()
                        
            guard error == nil else {
                self?.showAlertWithTitle("Error", message: "Error occured")
                return
            }
            
            guard let user = user else {
                self?.showAlertWithTitle("Error", message: "Invalid user")
                return
            }
            
            //assign current user
            Service.currentUser = user
            let chat = ChatViewController()
            self?.present(chat, animated: true, completion: nil)
        }
        
    }
    
    
}





