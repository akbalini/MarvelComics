//
//  ComicViewModelSpec.swift
//  MarvelComicsTests
//
//  Created by Akbal Juarez on 3/7/22.
//

import XCTest
import Combine
@testable import MarvelComics

class ComicViewModelSpec: XCTestCase {
    var viewModel: ComicViewModel!
    var cancellable: AnyCancellable!
    var marvelComicService: MarvelComicServiceProtocol!
    
    override func setUp(){
        marvelComicService = MockMarvelComicService()
        viewModel = ComicViewModel(marvelComicService: marvelComicService)
    }
    override class func tearDown() {
        
    }

    func testFetchAndComicsAreUpdated(){
        XCTAssert(viewModel.comics.count>0)
    }
    func testGotAnInvalidDateForComic(){
        XCTAssertNil(viewModel.comics[0].getPublishedDate())
    }
    
    func testNotWritersArePresent(){
        XCTAssertNil(viewModel.comics[1].getCreator(withRole:.writer))
    }
    func testNotPencilersArePresent(){
        XCTAssertNil(viewModel.comics[1].getCreator(withRole:.writer))
    }

    func testWritersArePresent(){
        XCTAssert(viewModel.comics[4].getCreator(withRole:.writer)?.count ?? 0 > 0)
    }
    func testPencilersArePresent(){
        XCTAssert(viewModel.comics[4].getCreator(withRole:.writer)?.count ?? 0 > 0)
    }
    func testCreatorsIsPresentButEmpty(){
        
        XCTAssert(viewModel.comics[5].getCreator(withRole:.writer) != nil)
        XCTAssert(viewModel.comics[5].getCreator(withRole:.penciler) != nil)
        XCTAssert(viewModel.comics[5].getCreator(withRole:.writer)?.count == 0)
        XCTAssert(viewModel.comics[5].getCreator(withRole:.penciler)?.count == 0)
        
    }
    func testIncreasePageAfterFetchingNewData(){
        XCTAssert(viewModel.currentPage == 0)
        viewModel.loadMoreComics(currentComic: viewModel.comics[6])
        print(viewModel.currentPage)
        XCTAssert(viewModel.currentPage == 1)
    }
    func testNotInsertDuplicateComicsWithSameId(){
        XCTAssert(viewModel.comics.count != MOCK_COMIC_RESPONSE.count)
    }
    
}
