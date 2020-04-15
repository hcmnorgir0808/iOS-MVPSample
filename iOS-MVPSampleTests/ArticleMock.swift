//
//  ArticleMock.swift
//  iOS-MVPSampleTests
//
//  Created by yaiwamoto on 15/04/2020.
//  Copyright © 2020 Yasutaka Iwamoto. All rights reserved.
//

import iOS_MVPSample

extension Article {
    static func mock() -> Article {
        let article = Article(title: "sample")
        return article
    }
}
