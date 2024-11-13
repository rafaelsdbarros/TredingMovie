//
//  ApiConfig.swift
//  TredingMovie
//
//  Created by Rafael on 13/11/24.
//

import Foundation

class ApiConfigConstant {
    
    public static var shared: ApiConfigConstant = ApiConfigConstant()
    
    //Singleton
    private init() {}
    
    public var apiKey: String {
        get{
            return "21e0592b1498bcb6a49160fdbd8ee576"
        }
    }
    
    public var serverAddress: String {
        get {
            return "https://api.themoviedb.org/3/"
        }
    }
    
    public var serverImageAddress: String {
        get {
            return "https://image.tmdb.org/t/p/w500/"
        }
    }

    public var movieEndpoint: String {
        get {
            return "trending/movie/day?api_key="
        }
    }

    //serveimage
}
