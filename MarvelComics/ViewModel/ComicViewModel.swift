//
//  ComicViewModel.swift
//  MarvelComics
//
//  Created by Akbal Juarez on 3/7/22.
//

import SwiftUI
import CryptoKit
import Combine

class ComicViewModel:ObservableObject{
    @Published var comics = [Comic]()
    
    var comicIds:Set<Int> = []

    private let marvelComicService:MarvelComicServiceProtocol
    var cancellable: AnyCancellable?
    var currentPage: Int
    var totalPages = 0
    var limit = 50
    
    init(marvelComicService: MarvelComicServiceProtocol = MarvelComicService()){
        self.marvelComicService = marvelComicService
        
        currentPage = 0
        fetchComics()
        
    }
    func fetchComics(){
        cancellable = marvelComicService.fetchComics(withOffset: currentPage*limit, limit).sink(receiveCompletion: { error in
            print(error)
        }, receiveValue: { comicsResponse in
            for comic in comicsResponse.data.results{
                if !self.comicIds.contains(comic.id){
                    self.comics.append(comic)
                    self.comicIds.insert(comic.id)
                }
            }
            self.totalPages = comicsResponse.data.total/self.limit

        })
    }
    func loadMoreComics(currentComic: Comic){
        let tIndex = self.comics.index(self.comics.endIndex, offsetBy: -10)
        let lastId = self.comics[tIndex].id
        if lastId == currentComic.id, (currentPage + 1) < totalPages{
            currentPage += 1
            fetchComics()
        }
    }
    func backGroundColor(forFormat format: String) -> UIColor{
        switch format{
        case "Digital Comic", "Digital Vertical Comic":
            return .systemMint
        case "Comic":
            return .systemGreen
        case "Trade Paper":
            return .systemCyan
        case "Hardpaper":
            return .systemPink
        case "Digest":
            return .systemTeal
        default:
            return .systemIndigo
        }
    }
    
}
