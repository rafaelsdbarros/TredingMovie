//
//  DetailsMovieViewModel.swift
//  TredingMovie
//
//  Created by Rafael on 14/11/24.
//

import Foundation

class DetailsMovieViewModel {
    var movie: Movie
    
    var movieImage: URL?
    var movieTitle: String?
    var movieDescription: String?
    var movidID: Int
    
    init(movie: Movie) {
        self.movie = movie
        
        self.movidID = movie.id
        self.movieTitle = movie.title
        self.movieDescription = movie.overview
        self.movieImage = makeImageUrl(pathImage: movie.posterPath ?? "")
    }
    
    private func makeImageUrl(pathImage: String) -> URL? {
        URL(string: "\(ApiConfigConstant.shared.serverImageAddress)\(pathImage)")
    }
}
