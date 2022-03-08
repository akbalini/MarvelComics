//
//  MarvelComicService.swift
//  MarvelComics
//
//  Created by Akbal Juarez on 3/7/22.
//

import Combine
import Foundation
import CryptoKit

protocol MarvelComicServiceProtocol{
    func fetchComics(withOffset offset: Int,_ limit: Int) -> AnyPublisher<ComicsResponse,Error>
}

final class MarvelComicService: MarvelComicServiceProtocol{
        
    let host = "gateway.marvel.com"
    let publicKey = //""
    let privateKey = //""
    let ts = String(NSDate().timeIntervalSince1970)
   
    lazy var hashV:String = {
        return self.md5(self.ts + self.privateKey + self.publicKey)
    }()
    
    func fetchComics(withOffset offset: Int,_ limit: Int = 20) -> AnyPublisher<ComicsResponse,Error>{
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = host
        urlComponents.path = "/v1/public/comics"
        urlComponents.queryItems = [
            URLQueryItem(name: "apikey", value: publicKey),
            URLQueryItem(name: "ts", value: ts),
            URLQueryItem(name: "hash", value: hashV),
            URLQueryItem(name: "offset", value: String(offset)),
            URLQueryItem(name: "limit", value: String(limit))
        ]
        
        
        var request = URLRequest(url: urlComponents.url!)
        request.httpMethod = "GET"
        let headers:[String:String] = [
            "Accept":"application/json"
        ]

        request.allHTTPHeaderFields = headers
        
        
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .map{ $0.data }
            .decode(type: ComicsResponse.self, decoder: getJSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
        
        
    }
    
    func md5(_ string: String) -> String {
        guard let data = string.data(using: .utf8) else{
            return ""
        }
        return Insecure.MD5.hash(data: data).prefix(Insecure.MD5.byteCount).map{
            String(format: "%02hhx", $0)
        }.joined()
    }
    
    func getJSONDecoder() -> JSONDecoder{
        let formatter = DateFormatter()
        formatter.locale = Locale.current
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ" // 2021-12-17T09:08:52-0500

        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(formatter)
        return decoder
    }
}



class MarvelAPIService<T:Codable>{
    static func getComics() -> Future<T, Error>{
        return Future<T, Error>{ completion in
            
        }
    }
}
