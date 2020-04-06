//
//  QiitaArticleSearchViewController.swift
//  iOS-MVPSample
//
//  Created by yaiwamoto on 29/03/2020.
//  Copyright © 2020 Yasutaka Iwamoto. All rights reserved.
//

import UIKit

final class QiitaArticleSearchViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    private var presenter: QiitaArticleSearchPresenterInput?
    
    func inject(presenter: QiitaArticleSearchPresenterInput) {
        self.presenter = presenter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        indicator.hidesWhenStopped = true
        searchBar.delegate = self
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view.
    }
}

extension QiitaArticleSearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.articles.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        if let article = presenter?.articles[indexPath.row] {
            cell.textLabel?.text = article.title
        }
        
        return cell
    }
    
    
}

extension QiitaArticleSearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "QiitaArticleDetailViewController", bundle: nil).instantiateInitialViewController() as! QiitaArticleDetailViewController
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension QiitaArticleSearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        indicator.startAnimating()
        presenter?.didTapSearchButton(text: searchBar.text)
    }
}

extension QiitaArticleSearchViewController: QiitaArticleSearchPresenterOutput {
    func showArticle(articles: [Article]) {
        indicator.stopAnimating()
        tableView.reloadData()
    }
    
    func hideUIActivityIndicatorView() {
        indicator.stopAnimating()
    }
}
