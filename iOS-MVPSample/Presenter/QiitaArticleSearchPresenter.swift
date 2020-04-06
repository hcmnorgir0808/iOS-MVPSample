//
//  QiitaArticleSearchPresenter.swift
//  iOS-MVPSample
//
//  Created by yaiwamoto on 29/03/2020.
//  Copyright © 2020 Yasutaka Iwamoto. All rights reserved.
//

import Foundation

protocol QiitaArticleSearchPresenterInput {
    var articles: [Article] { get }
    func didTapSearchButton(text: String?)
}

protocol QiitaArticleSearchPresenterOutput {
    func showArticle(articles: [Article])
    func hideUIActivityIndicatorView()
}

final class QiitaArticleSearchPresenter: QiitaArticleSearchPresenterInput {
    
    private(set) var articles = [Article]()
    
    private var model: QiitaArticleSearchModelInput
    private var view: QiitaArticleSearchPresenterOutput
        
    init(model: QiitaArticleSearchModelInput, view: QiitaArticleSearchPresenterOutput) {
        self.model = model
        self.view = view
    }
    
    func didTapSearchButton(text: String?) {
        guard let query = text, !query.isEmpty else {
            view.hideUIActivityIndicatorView()
            return
        }
        
        model.fetchArticle(query: query) { [weak self] articles in
            self?.articles = articles
            
            DispatchQueue.main.async {
                self?.view.showArticle(articles: articles)
            }
        }
    }
}
