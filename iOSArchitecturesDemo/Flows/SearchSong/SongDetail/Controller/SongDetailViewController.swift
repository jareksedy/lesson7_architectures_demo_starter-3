//
//  SongDetailViewController.swift
//  iOSArchitecturesDemo
//
//  Created by Ярослав on 14.10.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

final class SongDetailViewController: UIViewController {
    
    public var song: ITunesSong
    
    lazy var headerViewController = SongDetailHeaderViewController(song: song)
    
    private let imageDownloader = ImageDownloader()
    
    private var songDetailView: SongDetailView {
        return self.view as! SongDetailView
    }
    
    // MARK: - Lifecycle
    
    init(song: ITunesSong) {
        self.song = song
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
//
//    override func loadView() {
//        super.loadView()
//        self.view = AppDetailView()
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.configureNavigationController()
//        self.downloadImage()
        
        configureUI()
    }
    
    // MARK: - Private
    
    private func configureUI() {
        self.navigationController?.navigationBar.tintColor = UIColor.white;
        self.navigationItem.largeTitleDisplayMode = .never
        
        view.backgroundColor = .white
        
        addHeaderViewController()
    }
    
    private func addHeaderViewController() {
        self.addChild(headerViewController)
        self.view.addSubview(headerViewController.view)
        headerViewController.didMove(toParent: self)
        
        headerViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headerViewController.view.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            headerViewController.view.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor),
            headerViewController.view.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor)
        ])
    }

    
    
//    private func configureNavigationController() {
//        self.navigationController?.navigationBar.tintColor = UIColor.white;
//        self.navigationItem.largeTitleDisplayMode = .never
//    }
    
//    private func downloadImage() {
//        guard let url = self.app?.iconUrl else { return }
//        self.appDetailView.throbber.startAnimating()
//        self.imageDownloader.getImage(fromUrl: url) { (image, error) in
//            self.appDetailView.throbber.stopAnimating()
//            guard let image = image else { return }
//            self.appDetailView.imageView.image = image
//        }
//    }
}
