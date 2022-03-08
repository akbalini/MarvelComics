//
//  Image.swift
//  MarvelComis
//
//  Created by Akbal Juarez on 3/7/22.
//

import Foundation

struct ImageModel: Codable{
    var path:String
    var `extension`:String
   
    func getUrlStringFor(imageSize: ImageSize,imageMode: ImageMode) -> String{
        return path + "/" + imageMode.rawValue + "_" + imageSize.rawValue + "." + `extension`
    }
}
