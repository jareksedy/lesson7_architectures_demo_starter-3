//
//  SongDetailHeaderViewController.swift
//  iOSArchitecturesDemo
//
//  Created by Ярослав on 14.10.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

class SongDetailHeaderViewController: UIViewController {
    
    private let song: ITunesSong
    private let imageDownLoader = ImageDownloader()
    
    private var songDetailHeaderView: SongDetailHeaderView {
        return self.view as! SongDetailHeaderView
    }
    
    init(song: ITunesSong) {
        self.song = song
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = SongDetailHeaderView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fillData()
    }
    
    private func fillData() {
        downloadImage()
        
        songDetailHeaderView.titleLabel.text = song.trackName
        songDetailHeaderView.subTitleLabel.text = song.collectionName
        songDetailHeaderView.ratingLabel.text = song.artistName
    }
    
    private func downloadImage() {
        guard let url = song.artwork else { return }
        imageDownLoader.getImage(fromUrl: url) { [weak self] image, error in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                self.songDetailHeaderView.imageView.image = image
            }
        }
    }
    
}
