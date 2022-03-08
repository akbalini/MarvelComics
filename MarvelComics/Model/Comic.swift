//
//  Comic.swift
//  MarvelComis
//
//  Created by Akbal Juarez on 3/7/22.
//

import Foundation

struct Comic: Decodable, Identifiable {

    static func == (lhs: Comic, rhs: Comic) -> Bool {
        return lhs.id == rhs.id
    }
    
    var id:Int
    var title: String
    var description: String?
    var thumbnail: ImageModel
    var format: String
    var upc: String
    var textObjects: [TextObject]
    var dates:[ComicDates]?
    var creators:Creators
    
    func getTextForLenguage(leng: String) -> String{
        
        for t in textObjects{
            if t.language == leng{
                return t.text
            }
        }
        return ""
        
    }
    func getPublishedDate() -> String? {
        guard let dates = dates else{
            return nil
        }
        var publishedDate:String?
        for d in dates {
            if let type = d.type, let date = d.date, type == "onsaleDate" {
                let dateFormatterPrint = DateFormatter()
                dateFormatterPrint.dateFormat = "MMM dd,yyyy"
                publishedDate = dateFormatterPrint.string(from: date)
            }
        }
        return publishedDate
    }    
    func getCreator(withRole role: CreatorRole) -> [String]?{
        var pencilers:[String] = []
        if let creators = creators.items{
            for creator in creators{
                if creator.role.lowercased().contains(role.rawValue) {
                    pencilers.append(creator.name)
                }
            }
            return pencilers
        }else{
            return nil
        }
    }
    enum CreatorRole:String{
        case penciler
        case writer
    }
}



let MOCK_COMIC: [Comic] = [
    .init(id: 0, title: "Avengers", description: "comic that says everything about avengers", thumbnail: ImageModel(path: "1", extension: ""), format: "kdk", upc: "43424",textObjects: [TextObject(type: "fdf", language: "fdnf", text: "khjfj")], dates: [ComicDates(type: "onsaleDate", date: Date())], creators: Creators(available: 0, items: nil)),
    .init(id: 1, title: "SpiderMan", description: "SpiderMan the man that lives in the spider", thumbnail: ImageModel(path: "1", extension: ""), format: "sdjf", upc: "43424",textObjects: [TextObject(type: "fdf", language: "fdnf", text: "khjfj")], dates: [ComicDates(type: "onsaleDate", date: Date())], creators: Creators(available: 0, items: nil)),
    .init(id: 2, title: "La cucaracha", description: "comic that says everything about avengers", thumbnail: ImageModel(path: "", extension: ""), format: "mhjmhbgf", upc: "43424",textObjects: [TextObject(type: "fdf", language: "fdnf", text: "khjfj")], dates: [ComicDates(type: "onsaleDate", date: Date())], creators: Creators(available: 0, items: nil)),
    .init(id: 3, title: "Iron Man", description: "SpiderMan the man that lives in the spider", thumbnail: ImageModel(path: "", extension: ""), format: "dshjgbf", upc: "43424",textObjects: [TextObject(type: "fdf", language: "fdnf", text: "khjfj")], dates: [ComicDates(type: "onsaleDate", date: Date())], creators: Creators(available: 0, items: nil)),
    .init(id: 4, title: "Hulk", description: "comic that says everything about avengers", thumbnail: ImageModel(path: "", extension: ""), format: "jhfg", upc: "43424",textObjects: [TextObject(type: "fdf", language: "fdnf", text: "khjfj")], dates: [ComicDates(type: "onsaleDate", date: Date())], creators: Creators(available: 0, items: nil)),
    .init(id: 5, title: "black widow", description: "SpiderMan the man that lives in the spider", thumbnail: ImageModel(path: "", extension: ""), format: "djhdfbg", upc: "43424",textObjects: [TextObject(type: "fdf", language: "fdnf", text: "khjfj")], dates: [ComicDates(type: "onsaleDate", date: Date())], creators: Creators(available: 0, items: []))
]

