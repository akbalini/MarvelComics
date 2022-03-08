//
//  ComicDates.swift
//  MarvelComics
//
//  Created by Akbal Juarez on 3/7/22.
//

import Foundation

struct ComicDates:Decodable {
    var type:String?
    var date:Date?
}


extension ComicDates {
    
    private enum CodingKeys: String, CodingKey {
        case type, date
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        type = try? container.decode(String.self, forKey: .type)
        date = try? container.decode(Date.self, forKey: .date)
    }
}
