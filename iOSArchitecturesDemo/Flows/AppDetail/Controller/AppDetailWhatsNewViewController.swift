//
//  AppDetailWhatsNewViewController.swift
//  iOSArchitecturesDemo
//
//  Created by Ярослав on 12.10.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

class AppDetailWhatsNewViewController: UIViewController {
    
    private let app: ITunesApp
    
    private var appDetailWhatsNewView: AppDetailWhatsNewView {
        return self.view as! AppDetailWhatsNewView
    }
    
    init(app: ITunesApp) {
        self.app = app
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = AppDetailWhatsNewView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fillData()
    }
    
    private func fillData() {
        appDetailWhatsNewView.titleLabel.text = "Что нового"
        appDetailWhatsNewView.versionLabel.text = "Версия 6.66"
        appDetailWhatsNewView.lastUpdatedLabel.text = "5 дней назад"
        appDetailWhatsNewView.updateInfoLabel.text = "Различные обновления и улучшения производительности."
    }
}
