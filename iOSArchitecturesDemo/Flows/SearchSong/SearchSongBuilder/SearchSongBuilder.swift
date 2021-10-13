//
//  SearchSongBuilder.swift
//  iOSArchitecturesDemo
//
//  Created by Ярослав on 13.10.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

class SearchSongBuilder {
    static func build() -> (UIViewController & SearchSongViewInput) {
        let presenter = SearchSongPresenter()
        let viewController = SearchSongViewController(presenter: presenter)
        presenter.viewInput = viewController
        
        return viewController
    }
}
