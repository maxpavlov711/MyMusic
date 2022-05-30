//
//  NetworkService.swift
//  MyMusic
//
//  Created by Max Pavlov on 30.05.22.
//

import UIKit
import Alamofire

class NetworkService {
    
    func fetchTracks(searchText: String, completion: @escaping (SearchResponse?) -> Void) {
        let url = "https://itunes.apple.com/search"
        let parametrs = ["term":"\(searchText)", "limit":"10", "media":"music"]
        
        AF.request(url, method: .get, parameters: parametrs, encoding: URLEncoding.default, headers: nil).responseData { dataResponse in
            if let error = dataResponse.error {
                print("Error received requsting data: \(error.localizedDescription)")
                completion(nil)
            }
            
            guard let data = dataResponse.data else { return }
            
            let decoder = JSONDecoder()
            do {
                let objects = try decoder.decode(SearchResponse.self, from: data)
                print("objects ", objects)
                completion(objects)
                
            } catch let jsonError {
                print("Failed to decode JSON: \(jsonError.localizedDescription)")
                completion(nil)
            }
        }
    }
}


