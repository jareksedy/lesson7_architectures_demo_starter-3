//
//  SearchSongRouter.swift
//  iOSArchitecturesDemo
//
//  Created by Ярослав on 16.10.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

protocol SearchSongRouterInput {
    func openDetails(for song: ITunesSong)
}

class SearchSongRouter: SearchSongRouterInput {
    weak var viewController: UIViewController?
    
    func openDetails(for song: ITunesSong) {
        let songDetailViewController = SongDetailViewController(song: song)
        viewController?.navigationController?.pushViewController(songDetailViewController, animated: true)
    }
}
