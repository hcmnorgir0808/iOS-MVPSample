//
//  Article.swift
//  iOS-MVPSample
//
//  Created by yaiwamoto on 29/03/2020.
//  Copyright © 2020 Yasutaka Iwamoto. All rights reserved.
//

import Foundation

public struct Article: Codable {
    public let title: String
    
    public init(title: String) {
        self.title = title
    }
}
