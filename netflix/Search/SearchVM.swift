//
//  SearchVM.swift
//  netflix
//
//  Created by Anh Le Truong on 4/23/22.
//

//Published is one of the property wrappers in SwiftUI that allows us to trigger a view redraw whenever changes occur.

import Foundation
import SwiftUI

class SearchVM: ObservableObject{
    
    @Published var isLoading: Bool = false
    
    @Published var viewState: ViewState = ViewState.ready
    
    //variable popularMovies with Array of Movie, start with empty
    @Published var popularMovies : [Movie] = []
    @Published var searchResults : [Movie] = []
    @Published var isShowingPopularMovies = true
    
    
    //initializer
    init(){
        getPopularMovies()
    }
    
    public func updateSearchText(with text : String)
    {
        setViewState(to: .loading)
    
        
        if text.count > 0{
            isShowingPopularMovies = false
            getSearchResults(forText: text)
        }
        else{
            isShowingPopularMovies = true
        }
    }
    
    private func getPopularMovies(){
        self.popularMovies = generateMovies(40)
    }
    
    private func getSearchResults(forText text : String){
        
        //randomize result
        
        let haveResult = Int.random(in: 0...3)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2)
        {
            if haveResult == 0{
                //empty view
                self.searchResults = []
                self.setViewState(to: .empty)
            }
            else {
                //ready
                let movies = generateMovies(21)
                self.searchResults = movies
                self.setViewState(to: .ready)
            }
            
        }
    }
    
    
    //function keep all states in-sync everytime text update
    private func setViewState(to state: ViewState){
        //change on mainthread
        DispatchQueue.main.async {
            self.viewState = state
            //check if state is loading or not
            self.isLoading = state  == .loading
        }
    }
}



enum ViewState{
    case empty
    case loading
    case ready
    case error
}
