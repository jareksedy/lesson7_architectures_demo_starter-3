//
//  SearchSongInteractor.swift
//  iOSArchitecturesDemo
//
//  Created by Ярослав on 16.10.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import Alamofire

protocol SearchSongInteractorInput {
    func requestSongs(with query: String, completion: @escaping (Result<[ITunesSong]>) -> Void)
}

class SearchSongInteractor: SearchSongInteractorInput {
    private let searchService = ITunesSearchService()
    
    func requestSongs(with query: String, completion: @escaping (Result<[ITunesSong]>) -> Void) {
        searchService.getSongs(forQuery: query, completion: completion)
    }
}
