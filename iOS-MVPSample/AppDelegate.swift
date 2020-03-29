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
        // Override point for customization after application launch.
        let qiitaArticleSearchViewController = UIStoryboard(name: "QiitaArticleSearchViewController", bundle: nil).instantiateInitialViewController() as! QiitaArticleSearchViewController
        let navigationController = UINavigationController(rootViewController: qiitaArticleSearchViewController)
        
        let model = QiitaArticleSearchModel()
        let presenter = QiitaArticleSearchPresenter(model: model, view: qiitaArticleSearchViewController)
        
        qiitaArticleSearchViewController.inject(presenter: presenter)
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        return true
    }
}

