//
//  MockMarvelComicService.swift
//  MarvelComicsTests
//
//  Created by Akbal Juarez on 3/7/22.
//

import Foundation
import Combine
@testable import MarvelComics

final class MockMarvelComicService: MarvelComicServiceProtocol{
    func fetchComics(withOffset offset: Int, _ limit: Int) -> AnyPublisher<ComicsResponse, Error> {
        let data:ComicsResponse = ComicsResponse(code: 200, status: "OK", data: ComicsData(offset: 0, limit: 6, total: 1000, count: 6, results: MOCK_COMIC_RESPONSE))
        return Just(data)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
    
    
}

let MOCK_COMIC_RESPONSE: [Comic] = [
    .init(id: 0, title: "Avengers", description: "comic that says everything about avengers", thumbnail: ImageModel(path: "1", extension: ""), format: "kdk", upc: "43424",textObjects: [TextObject(type: "fdf", language: "fdnf", text: "khjfj")], dates: [ComicDates(type: "onsaleDate", date: nil)], creators: Creators(available: 0, items: nil)),
    .init(id: 1, title: "SpiderMan", description: "SpiderMan the man that lives in the spider", thumbnail: ImageModel(path: "1", extension: ""), format: "sdjf", upc: "43424",textObjects: [TextObject(type: "fdf", language: "fdnf", text: "khjfj")], dates: [ComicDates(type: "onsaleDate", date: Date())], creators: Creators(available: 0, items: nil)),
    .init(id: 2, title: "La cucaracha", description: "comic that says everything about avengers", thumbnail: ImageModel(path: "", extension: ""), format: "mhjmhbgf", upc: "43424",textObjects: [TextObject(type: "fdf", language: "fdnf", text: "khjfj")], dates: [ComicDates(type: "onsaleDate", date: Date())], creators: Creators(available: 0, items: nil)),
    .init(id: 3, title: "Iron Man", description: "SpiderMan the man that lives in the spider", thumbnail: ImageModel(path: "", extension: ""), format: "dshjgbf", upc: "43424",textObjects: [TextObject(type: "fdf", language: "fdnf", text: "khjfj")], dates: [ComicDates(type: "onsaleDate", date: Date())], creators: Creators(available: 0, items: nil)),
    .init(id: 4, title: "Hulk", description: "comic that says everything about avengers", thumbnail: ImageModel(path: "", extension: ""), format: "jhfg", upc: "43424",textObjects: [TextObject(type: "fdf", language: "fdnf", text: "khjfj")], dates: [ComicDates(type: "onsaleDate", date: Date())], creators: Creators(available: 0, items: [Creator(name: "Raul", role: "writer"),Creator(name: "Rodolfo", role: "writer"),Creator(name: "Son", role: "penciler")])),
    .init(id: 5, title: "black widow", description: "SpiderMan the man that lives in the spider", thumbnail: ImageModel(path: "", extension: ""), format: "djhdfbg", upc: "43424",textObjects: [TextObject(type: "fdf", language: "fdnf", text: "khjfj")], dates: [ComicDates(type: "onsaleDate", date: Date())], creators: Creators(available: 0, items: [])),
    .init(id: 6, title: "Avengers", description: "comic that says everything about avengers", thumbnail: ImageModel(path: "1", extension: ""), format: "kdk", upc: "43424",textObjects: [TextObject(type: "fdf", language: "fdnf", text: "khjfj")], dates: [ComicDates(type: "onsaleDate", date: nil)], creators: Creators(available: 0, items: nil)),
    .init(id: 7, title: "SpiderMan", description: "SpiderMan the man that lives in the spider", thumbnail: ImageModel(path: "1", extension: ""), format: "sdjf", upc: "43424",textObjects: [TextObject(type: "fdf", language: "fdnf", text: "khjfj")], dates: [ComicDates(type: "onsaleDate", date: Date())], creators: Creators(available: 0, items: nil)),
    .init(id: 8, title: "La cucaracha", description: "comic that says everything about avengers", thumbnail: ImageModel(path: "", extension: ""), format: "mhjmhbgf", upc: "43424",textObjects: [TextObject(type: "fdf", language: "fdnf", text: "khjfj")], dates: [ComicDates(type: "onsaleDate", date: Date())], creators: Creators(available: 0, items: nil)),
    .init(id: 9, title: "Iron Man", description: "SpiderMan the man that lives in the spider", thumbnail: ImageModel(path: "", extension: ""), format: "dshjgbf", upc: "43424",textObjects: [TextObject(type: "fdf", language: "fdnf", text: "khjfj")], dates: [ComicDates(type: "onsaleDate", date: Date())], creators: Creators(available: 0, items: nil)),
    .init(id: 10, title: "Hulk", description: "comic that says everything about avengers", thumbnail: ImageModel(path: "", extension: ""), format: "jhfg", upc: "43424",textObjects: [TextObject(type: "fdf", language: "fdnf", text: "khjfj")], dates: [ComicDates(type: "onsaleDate", date: Date())], creators: Creators(available: 0, items: [Creator(name: "Raul", role: "writer"),Creator(name: "Rodolfo", role: "writer"),Creator(name: "Son", role: "penciler")])),
    .init(id: 11, title: "black widow", description: "SpiderMan the man that lives in the spider", thumbnail: ImageModel(path: "", extension: ""), format: "djhdfbg", upc: "43424",textObjects: [TextObject(type: "fdf", language: "fdnf", text: "khjfj")], dates: [ComicDates(type: "onsaleDate", date: Date())], creators: Creators(available: 0, items: [])),
    .init(id: 12, title: "Avengers", description: "comic that says everything about avengers", thumbnail: ImageModel(path: "1", extension: ""), format: "kdk", upc: "43424",textObjects: [TextObject(type: "fdf", language: "fdnf", text: "khjfj")], dates: [ComicDates(type: "onsaleDate", date: nil)], creators: Creators(available: 0, items: nil)),
    .init(id: 13, title: "SpiderMan", description: "SpiderMan the man that lives in the spider", thumbnail: ImageModel(path: "1", extension: ""), format: "sdjf", upc: "43424",textObjects: [TextObject(type: "fdf", language: "fdnf", text: "khjfj")], dates: [ComicDates(type: "onsaleDate", date: Date())], creators: Creators(available: 0, items: nil)),
    .init(id: 14, title: "La cucaracha", description: "comic that says everything about avengers", thumbnail: ImageModel(path: "", extension: ""), format: "mhjmhbgf", upc: "43424",textObjects: [TextObject(type: "fdf", language: "fdnf", text: "khjfj")], dates: [ComicDates(type: "onsaleDate", date: Date())], creators: Creators(available: 0, items: nil)),
    .init(id: 15, title: "Iron Man", description: "SpiderMan the man that lives in the spider", thumbnail: ImageModel(path: "", extension: ""), format: "dshjgbf", upc: "43424",textObjects: [TextObject(type: "fdf", language: "fdnf", text: "khjfj")], dates: [ComicDates(type: "onsaleDate", date: Date())], creators: Creators(available: 0, items: nil)),
    .init(id: 4, title: "Hulk", description: "comic that says everything about avengers", thumbnail: ImageModel(path: "", extension: ""), format: "jhfg", upc: "43424",textObjects: [TextObject(type: "fdf", language: "fdnf", text: "khjfj")], dates: [ComicDates(type: "onsaleDate", date: Date())], creators: Creators(available: 0, items: [Creator(name: "Raul", role: "writer"),Creator(name: "Rodolfo", role: "writer"),Creator(name: "Son", role: "penciler")])),
    .init(id: 5, title: "black widow", description: "SpiderMan the man that lives in the spider", thumbnail: ImageModel(path: "", extension: ""), format: "djhdfbg", upc: "43424",textObjects: [TextObject(type: "fdf", language: "fdnf", text: "khjfj")], dates: [ComicDates(type: "onsaleDate", date: Date())], creators: Creators(available: 0, items: []))
]
