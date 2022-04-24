//
//  HomeVM.swift
//  netflix
//
//  Created by Anh Le Truong on 4/21/22.
//

import Foundation

class HomeVM: ObservableObject {
    
    
    @Published var movies :[String: [Movie]] = [:]
    
    
    //get allCategory
    public var allCategories: [String]
    {
        movies.keys.map({String($0)})
    }
    
    
    public var allGenre : [HomeGenre] = [.AllGenres, .Action,.Comedy,.Horror,.Thriller]
    
    
    //return movie
    public func getMovie(forCat cat : String, andHomeRow homeRow: HomeTopRow, andGenre genre :  HomeGenre) -> [Movie]{
        
        switch homeRow{
        case .home:
            return movies[cat] ?? []
        case .movies:
            return (movies[cat] ??  []).filter({ ($0.movieType == .movie) && ($0.genre == genre)  })
        case .tvShows:
            return (movies[cat] ??  []).filter({ ($0.movieType == .tvShow) && ($0.genre == genre)})
        case .myLists:
            return movies[cat] ?? []
        }
    }
    
    init()
    {
        setupMovies()
    }
    
    
    func setupMovies()
    {
        movies["Trending Now"] = exampleMovies
        movies["Stand-Up Comedy"] = exampleMovies.shuffled()
        movies["New Releases"] = exampleMovies.shuffled()
        movies["Watch Again"] = exampleMovies.shuffled()
        movies["Sci-fi"] = exampleMovies.shuffled()
        movies["Sci-efi"] = exampleMovies.shuffled()
    }
}
