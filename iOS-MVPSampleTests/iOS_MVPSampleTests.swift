//
//  iOS_MVPSampleTests.swift
//  iOS-MVPSampleTests
//
//  Created by yaiwamoto on 29/03/2020.
//  Copyright © 2020 Yasutaka Iwamoto. All rights reserved.
//

import XCTest
@testable import iOS_MVPSample

class QiitaArticleSearchPresenterOutputSpy: QiitaArticleSearchPresenterOutput {
    
    private(set) var isHideUIActivityIndicatorView = false
    
    func showArticle(articles: [Article]) {
        
    }
    
    func hideUIActivityIndicatorView() {
        isHideUIActivityIndicatorView = true
    }
}

class QiitaArticleSearchModelInputStub: QiitaArticleSearchModelInput {
    func fetchArticle(query: String, completion: @escaping ([Article]) -> ()) {
        completion([Article.mock()])
    }
    
   
}

class iOS_MVPSampleTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testDidTapSearchButton() {
        XCTContext.runActivity(named: "検索ボタンタップ時処理") { _ in
            XCTContext.runActivity(named: "検索文字がnilの場合_UIActivityIndicatorViewを隠す") { _ in
                let spy = QiitaArticleSearchPresenterOutputSpy()
                let stub = QiitaArticleSearchModelInputStub()
                let presenter = QiitaArticleSearchPresenter(model: stub, view: spy)
                presenter.didTapSearchButton(text: nil)
                
                XCTAssertTrue(spy.isHideUIActivityIndicatorView)
            }
            
            XCTContext.runActivity(named: "検索文字が空文字の場合_UIActivityIndicatorViewを隠す") { _ in
                let spy = QiitaArticleSearchPresenterOutputSpy()
                let stub = QiitaArticleSearchModelInputStub()
                let presenter = QiitaArticleSearchPresenter(model: stub, view: spy)
                presenter.didTapSearchButton(text: "")
                
                XCTAssertTrue(spy.isHideUIActivityIndicatorView)
            }
            
            XCTContext.runActivity(named: "検索文字がnilまたは空文字ぎ以外の場合_Qiitaの記事を取得できること") { _ in
                let spy = QiitaArticleSearchPresenterOutputSpy()
                let stub = QiitaArticleSearchModelInputStub()
                let presenter = QiitaArticleSearchPresenter(model: stub, view: spy)
                presenter.didTapSearchButton(text: "query")
                
                XCTAssertEqual(presenter.articles, [Article(title: "sample")])
            }
        }
    }
}

extension Article: Equatable {
    public static func ==(lhs: Article, rhs: Article) -> Bool {
        return lhs.title == rhs.title
    }
}
