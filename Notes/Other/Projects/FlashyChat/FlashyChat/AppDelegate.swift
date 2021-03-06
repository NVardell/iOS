//
//  AppDelegate.swift
//  FlashyChat
//
//  Created by Nate Vardell on 11/2/21.
//

import UIKit
import Firebase
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Firebase Setup
        FirebaseApp.configure()                    // Initialize Firebase SDK to configure APIs
        let db = Firestore.firestore(); print(db)  // Initialize Firebase's Cloud Firestore Database
        
        // Keyboard Manager Setup
        IQKeyboardManager.shared.enable = true  // Enable Keyboard Manager Dependency
        IQKeyboardManager.shared.enableAutoToolbar = false  // Hide Toolbar at top of Keyboard View
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true  // Auto-hide Keyboard if touched outside text field
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

