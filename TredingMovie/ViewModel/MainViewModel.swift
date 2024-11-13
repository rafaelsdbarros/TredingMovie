//
//  MainViewModel.swift
//  TredingMovie
//
//  Created by Rafael on 13/11/24.
//

import Foundation

class MainViewModel {
    
    var isLoading: Observable<Bool> = Observable(false)
    var cellDataSource: Observable<[MovieTableCellViewModel]> = Observable(nil)
    var dataSource: TrendingMovieDTO?
    
    //total of pages
    func numberOfSections() -> Int{
        1
    }
    
    //total of items
    func numberOfRows(in section: Int) -> Int {
        self.dataSource?.results.count ?? 0
    }
    
    func getData() {
        if isLoading.value ?? true {
            return
        }
        isLoading.value = true
        APICaller.getTrendingMovies(completionHandler: { [weak self] result in
            self?.isLoading.value = false
            
            switch result {
            case.success(let data):
                print("Top trending counts: \(data.results.count)")
                self?.dataSource = data
                self?.mapCellData()
            case.failure(let error):
                print(error)
            }
            
        })
    }
    
    func mapCellData(){
        self.cellDataSource.value = self.dataSource?.results.compactMap({MovieTableCellViewModel(movie: $0)})
    }
    
    func getMovieTitle(_ movie: MovieTableCellViewModel) -> String {
        return movie.title
    }
    
    func retriveMovie(with id: Int) -> Movie? {
        guard let movie = dataSource?.results.first(where: {$0.id == id}) else {
            return nil
        }
        return movie
    }
    
}
