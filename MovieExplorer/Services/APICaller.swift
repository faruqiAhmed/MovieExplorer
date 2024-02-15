//
//  APICaller.swift
//  MovieExplorer
//
//  Created by Md Omar Faruq on 16/2/24.
//

import Foundation
import UIKit

enum NetworkError: Error {
    case urlError
    case canNotParseData
}

public class APICaller {
    static func getTrendingMovies(completionHandler: @escaping (_ result: Result<MovieListModel, NetworkError>) -> Void) {
        if NetworkConstants.shared.apiKey.isEmpty {
            print("<!> API KEY is Missing <!>")
            print("<!> Get One from: https://www.themoviedb.org/ <!>")
            return
        }
        
        let urlString = NetworkConstants.shared.serverAddress +
                "trending/all/day?api_key=" +
                NetworkConstants.shared.apiKey
                
        guard let url = URL(string: urlString) else {
            completionHandler(Result.failure(.urlError))
            return
        }
        
        URLSession.shared.dataTask(with: url) { dataResponse, urlResponse, err in
            if err == nil,
               let data = dataResponse,
               let resultData = try? JSONDecoder().decode(MovieListModel.self, from: data) {
                completionHandler(.success(resultData))
            } else {
                print(err.debugDescription)
                completionHandler(.failure(.canNotParseData))
            }
        }.resume()
    }
}
