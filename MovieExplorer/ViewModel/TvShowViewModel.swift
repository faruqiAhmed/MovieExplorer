//
//  TvShowViewModel.swift
//  MovieExplorer
//
//  Created by Md Omar Faruq on 16/2/24.
//

import Foundation
class TvShowViewModel {
    var isLoadingData: Observable<Bool> = Observable(false)
    var dataSource: MovieListModel?
    var movies: Observable<[TvShowCollViewModel]> = Observable(nil)
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfRows(in section: Int) -> Int {
        return dataSource?.results.count ?? 0
    }
    func getDataTV() {
        if isLoadingData.value ?? true {
            return
        }
        isLoadingData.value = true
        APICaller.getTvMovies{ [weak self] result in
            self?.isLoadingData.value = false
            switch result {
            case .success(let trendingMovieData):
                self?.dataSource = trendingMovieData
                self?.mapMovieData()
                print(result)
            case .failure(let err):
                print(err)
            }
        }
    }
    private func mapMovieData() {
        movies.value = self.dataSource?.results.compactMap({TvShowCollViewModel(movie: $0)})
    }
    
    func getMovieTitle(_ movie: Movie) -> String {
        return movie.title ?? ""
    }
    
    func retriveMovie(withId id: Int) -> Movie? {
        guard let movie = dataSource?.results.first(where: {$0.id == id}) else {
            return nil
        }
        
        return movie
    }
}
