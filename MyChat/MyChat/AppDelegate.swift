//
//  AppDelegate.swift
//  MyChat
//
//  Created by Dmitriy Tarelkin on 23/11/18.
//  Copyright © 2018 Dmitriy Tarelkin. All rights reserved.
//

import UIKit
import ReactiveSwift
import Result
import SendBirdSDK


let kAppID = "390A88BB-F6EC-4942-B391-1F489CBF6C77"

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        //instatiate SBD
        SBDMain.initWithApplicationId(kAppID)
        
        //log in vc
//        let LogInVC = LoginViewController()
        let chat = ChatViewController()
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
//        self.window?.rootViewController = LogInVC
        self.window?.rootViewController = chat
        self.window?.makeKeyAndVisible()
        
        //network
        

        let observingSignal = Signal<[Message], RetrievalError>.Observer(
        value: { (messages) in
            messages.forEach({ (message) in
                print(message.text)
            })
        }, failed: { (retrievalError) in
            print(retrievalError.localizedDescription)
        }, completed: {             print("completed")
        }) {
            print("interapted")
        }
        
//        let disposable = chatWrapper.messageCollectionProducer().start(observingSignal)
        let dis = ChatWrapper.messageCollectionProducer().start(observingSignal)
        
        //disposable.dispose()
        
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
    }

}

