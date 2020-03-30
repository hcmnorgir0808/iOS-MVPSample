//
//  AppDelegate.swift
//  iOS-MVPSample
//
//  Created by yaiwamoto on 29/03/2020.
//  Copyright © 2020 Yasutaka Iwamoto. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let mainTabViewController = MainTabViewController()
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = mainTabViewController
        self.window?.makeKeyAndVisible()
        
        return true
    }
}

