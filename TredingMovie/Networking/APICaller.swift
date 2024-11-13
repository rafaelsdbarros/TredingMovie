//
//  APICaller.swift
//  TredingMovie
//
//  Created by Rafael on 13/11/24.
//

import Foundation

enum NetworkError: Error {
    case urlError
    case canNotParseData
    case requestError
}

class APICaller {
    
    static func getTrendingMovies(completionHandler: @escaping (_ result: Result<TrendingMovieDTO, NetworkError>) -> Void) {
        
        let getFullUrlString = ApiConfigConstant.shared.serverAddress +
                        ApiConfigConstant.shared.movieEndpoint +
                        ApiConfigConstant.shared.apiKey
        
        guard let url = URL(string: getFullUrlString) else {
            completionHandler(.failure(.urlError))
            return
        }
        
        //create request
        URLSession.shared.dataTask(with: url) { dataResponse, urlResponse, error in
            if error == nil,
               let data = dataResponse,
               let resultData = try? JSONDecoder().decode(TrendingMovieDTO.self, from: data) {
                completionHandler(.success(resultData))
            }else {
                completionHandler(.failure(.canNotParseData))
            }
        }.resume()
    }
    
}
