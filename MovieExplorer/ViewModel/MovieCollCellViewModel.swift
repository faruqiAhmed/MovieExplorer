//
//  MovieCollCellViewModel.swift
//  MovieExplorer
//
//  Created by Md Omar Faruq on 16/2/24.
//

import Foundation
class  MovieCollCellViewModel {
    var id: Int
    var name: String
//    var date: String
//    var score: String
  //  var image: URL?
    
    init(movie: Movie) {
        self.id = movie.id
        self.name = movie.name ?? ""
//        self.date = movie.releaseDate ?? movie.firstAirDate ?? ""
//        self.score = "\(movie.voteAverage)/10"
       // self.image = makeImageURL(movie.posterPath ?? "")
    }
    
    private func makeImageURL(_ imageCode: String) -> URL? {
        URL(string: "\(NetworkConstants.shared.imageServerAddress)\(imageCode)")
    }
}

