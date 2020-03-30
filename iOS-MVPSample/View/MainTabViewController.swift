//
//  MainTabViewController.swift
//  iOS-MVPSample
//
//  Created by yaiwamoto on 30/03/2020.
//  Copyright © 2020 Yasutaka Iwamoto. All rights reserved.
//

import UIKit

class MainTabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let qiitaArticleSearchViewController = UIStoryboard(name: "QiitaArticleSearchViewController", bundle: nil).instantiateInitialViewController() as! QiitaArticleSearchViewController
        let navigationController = UINavigationController(rootViewController: qiitaArticleSearchViewController)
        
        let model = QiitaArticleSearchModel()
        let presenter = QiitaArticleSearchPresenter(model: model, view: qiitaArticleSearchViewController)
        
        qiitaArticleSearchViewController.inject(presenter: presenter)

        navigationController.tabBarItem = UITabBarItem(tabBarSystemItem: .history, tag: 1)
        
        
        let qiitaArticleSearchViewController2 = UIStoryboard(name: "QiitaArticleSearchViewController", bundle: nil).instantiateInitialViewController() as! QiitaArticleSearchViewController
        let navigationController2 = UINavigationController(rootViewController: qiitaArticleSearchViewController2)
        
        let model2 = QiitaArticleSearchModel()
        let presenter2 = QiitaArticleSearchPresenter(model: model2, view: qiitaArticleSearchViewController2)
        
        qiitaArticleSearchViewController2.inject(presenter: presenter2)

        navigationController2.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 2)
        let tabVC = [navigationController, navigationController2]
        
        self.setViewControllers(tabVC, animated: false)
        
        // Do any additional setup after loading the view.
    }

}
