//
//  SongDetailHeaderView.swift
//  iOSArchitecturesDemo
//
//  Created by Ярослав on 14.10.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

class SongDetailHeaderView: UIView {
    
    private(set) lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 30.0
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private(set) lazy var trackNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    private(set) lazy var albumLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        return label
    }()
    
    private(set) lazy var artistLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
        super.init(coder: coder)
        configureUI()
    }
    
    private func configureUI() {
        self.addSubview(imageView)
        self.addSubview(trackNameLabel)
        self.addSubview(albumLabel)
        self.addSubview(artistLabel)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 12),
            imageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16.0),
            imageView.widthAnchor.constraint(equalToConstant: 120),
            imageView.heightAnchor.constraint(equalToConstant: 120),
            
            trackNameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 12),
            trackNameLabel.leftAnchor.constraint(equalTo: imageView.rightAnchor, constant: 16),
            trackNameLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            
            albumLabel.topAnchor.constraint(equalTo: trackNameLabel.bottomAnchor, constant: 6),
            albumLabel.leftAnchor.constraint(equalTo: imageView.rightAnchor, constant: 16),
            albumLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            
            artistLabel.topAnchor.constraint(equalTo: albumLabel.bottomAnchor, constant: 24),
            artistLabel.leftAnchor.constraint(equalTo: imageView.rightAnchor, constant: 16),
            artistLabel.widthAnchor.constraint(equalToConstant: 100),
            artistLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
