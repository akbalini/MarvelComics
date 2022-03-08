//
//  ComicsData.swift
//  MarvelComics
//
//  Created by Akbal Juarez on 3/7/22.
//

import Foundation

struct ComicsData: Decodable{
    var offset: Int
    var limit: Int
    var total: Int
    var count: Int
    var results:[Comic]
}
