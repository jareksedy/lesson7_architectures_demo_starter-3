//
//  SearchSongViewController.swift
//  iOSArchitecturesDemo
//
//  Created by Ярослав on 14.10.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

final class SearchSongViewController: UIViewController {
    
    // MARK: - Private Properties
    
    private var searchSongView: SearchSongView {
        return self.view as! SearchSongView
    }
    
    private let presenter: SearchSongViewOutput
    
    private let searchService = ITunesSearchService()
    public var searchResults = [ITunesApp]() {
        didSet {
            searchSongView.tableView.isHidden = false
            searchSongView.tableView.reloadData()
            searchSongView.searchBar.resignFirstResponder()
        }
    }
    
    private struct Constants {
        static let reuseIdentifier = "reuseId"
    }
    
    init(presenter: SearchSongViewOutput) {
        self.presenter = presenter
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        self.view = SearchSongView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.searchSongView.searchBar.delegate = self
        self.searchSongView.tableView.register(AppCell.self, forCellReuseIdentifier: Constants.reuseIdentifier)
        self.searchSongView.tableView.delegate = self
        self.searchSongView.tableView.dataSource = self
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.throbber(show: false)
    }
    
    // MARK: - Private
    
    
    
//    private func requestApps(with query: String) {
//        self.throbber(show: true)
//        self.searchResults = []
//        self.searchView.tableView.reloadData()
//
//        self.searchService.getApps(forQuery: query) { [weak self] result in
//            guard let self = self else { return }
//            self.throbber(show: false)
//            result
//                .withValue { apps in
//                    guard !apps.isEmpty else {
//                        self.searchResults = []
//                        self.showNoResults()
//                        return
//                    }
//                    self.hideNoResults()
//                    self.searchResults = apps
//
//                    self.searchView.tableView.isHidden = false
//                    self.searchView.tableView.reloadData()
//
//                    self.searchView.searchBar.resignFirstResponder()
//                }
//                .withError {
//                    self.showError(error: $0)
//                }
//        }
//    }
}

//MARK: - UITableViewDataSource
extension SearchSongViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dequeuedCell = tableView.dequeueReusableCell(withIdentifier: Constants.reuseIdentifier, for: indexPath)
        guard let cell = dequeuedCell as? AppCell else {
            return dequeuedCell
        }
        let app = self.searchResults[indexPath.row]
        let cellModel = AppCellModelFactory.cellModel(from: app)
        cell.configure(with: cellModel)
        return cell
    }
}

//MARK: - UITableViewDelegate
extension SearchSongViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let app = searchResults[indexPath.row]
        let appDetaillViewController = AppDetailViewController(app: app)
        appDetaillViewController.app = app
//        navigationController?.pushViewController(appDetaillViewController, animated: true)
        presenter.viewDidSelectApp(app: app)
    }
}

//MARK: - UISearchBarDelegate
extension SearchSongViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let query = searchBar.text else {
            searchBar.resignFirstResponder()
            return
        }
        if query.count == 0 {
            searchBar.resignFirstResponder()
            return
        }
//        self.requestApps(with: query)
        
        presenter.viewDidSearch(with: query)
    }
}

extension SearchSongViewController: SearchSongViewInput {
    func throbber(show: Bool) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = show
    }
    
    func showError(error: Error) {
        let alert = UIAlertController(title: "Error", message: "\(error.localizedDescription)", preferredStyle: .alert)
        let actionOk = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(actionOk)
        self.present(alert, animated: true, completion: nil)
    }
    
    func showNoResults() {
        self.searchSongView.emptyResultView.isHidden = false
    }
    
    func hideNoResults() {
        self.searchSongView.emptyResultView.isHidden = true
    }
}
