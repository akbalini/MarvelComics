//
//  ComicsResponse.swift
//  MarvelComics
//
//  Created by Akbal Juarez on 3/7/22.
//

import Foundation

struct ComicsResponse: Decodable {
    var code: Int
    var status: String
    var data: ComicsData
}
