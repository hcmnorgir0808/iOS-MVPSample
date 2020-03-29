//
//  QiitaArticleSearchModel.swift
//  iOS-MVPSample
//
//  Created by yaiwamoto on 29/03/2020.
//  Copyright © 2020 Yasutaka Iwamoto. All rights reserved.
//

import Foundation

protocol QiitaArticleSearchModelInput {
    func fetchArticle(query: String, completion: @escaping ([Article]) -> ())
}

final class QiitaArticleSearchModel: QiitaArticleSearchModelInput {
    func fetchArticle(query: String, completion: @escaping ([Article]) -> ()) {
        let urlString = "https://qiita.com//api/v2/users/\(query)/items?page=1&per_page=10"
        
        guard let url = URLComponents(string: urlString) else { return }
        let task = URLSession.shared.dataTask(with: url.url!) { (data, _, error) in
            if error != nil {
                print(error!.localizedDescription)
            }
            guard let data = data else { return }
            
            let article = try! JSONDecoder().decode([Article].self, from: data)
            DispatchQueue.main.async {
                completion(article)
            }
        }
        task.resume()
    }
}
