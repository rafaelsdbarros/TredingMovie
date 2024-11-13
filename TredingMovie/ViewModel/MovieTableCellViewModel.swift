//
//  MovieTableCellViewModel.swift
//  TredingMovie
//
//  Created by Rafael on 14/11/24.
//

import Foundation


class MovieTableCellViewModel {
    var id: Int
    var title: String
    var date: String
    var rating: String
    var imageUrl: URL?
    
    init(movie: Movie) {
        self.id = movie.id
        self.title = movie.title ?? ""
        self.date = movie.releaseDate ?? ""
        self.rating = "\(movie.voteAverage ?? 0)/10"
        self.imageUrl = makeImageUrl(movie.posterPath ?? "")
    }
    
    private func makeImageUrl(_ imagePath: String) -> URL? {
        URL(string: "\(ApiConfigConstant.shared.serverImageAddress)\(imagePath)")
    }
}
