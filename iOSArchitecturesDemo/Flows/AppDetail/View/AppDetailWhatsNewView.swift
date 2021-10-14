//
//  AppDetailWhatsNewView.swift
//  iOSArchitecturesDemo
//
//  Created by Ярослав on 12.10.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

class AppDetailWhatsNewView: UIView {
    
    private(set) lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    private(set) lazy var versionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    private(set) lazy var lastUpdatedLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    private(set) lazy var updateInfoLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 17)
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
        self.addSubview(titleLabel)
        self.addSubview(versionLabel)
        self.addSubview(lastUpdatedLabel)
        self.addSubview(updateInfoLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 12),
            titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            titleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            
            versionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            versionLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            versionLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            
            lastUpdatedLabel.topAnchor.constraint(equalTo: versionLabel.bottomAnchor, constant: 8),
            lastUpdatedLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            lastUpdatedLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            
            updateInfoLabel.topAnchor.constraint(equalTo: lastUpdatedLabel.bottomAnchor, constant: 12),
            updateInfoLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            updateInfoLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
        ])
    }
}
