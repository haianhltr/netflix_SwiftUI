//
//  HomeStack.swift
//  netflix
//
//  Created by Anh Le Truong on 4/23/22.
//

import Foundation
import SwiftUI

struct HomeStack: View {
    
    var vm : HomeVM
    
    var topRowSelection: HomeTopRow
    var selectedGenre: HomeGenre
    
    @Binding var movieDetailToShow: Movie?
    var body: some View {
        ForEach(vm.allCategories, id: \.self) { category in
            VStack {
                HStack {
                    Text(category)
                        .font(.title3)
                        .bold()
                    Spacer()
                }
                ScrollView(.horizontal, showsIndicators: true)
                {
                    LazyHStack{
                        //each movie
                        ForEach(vm.getMovie(forCat: category, andHomeRow: topRowSelection, andGenre: selectedGenre)) { movie in
                            StandardHomeMovie(movie: movie)
                                .frame(width: 135, height: 200)
                              
                                .onTapGesture(perform: {
                                    
                                    //pass back to HomeView
                                    movieDetailToShow = movie
                                })
                        }
                        
                    }
                }
                
            }
            .padding(.leading,6)
        }
    }
}


struct HomeStack_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color.black.ignoresSafeArea(.all)
            ScrollView{
                HomeStack(vm: HomeVM(), topRowSelection: .home, selectedGenre: .AllGenres, movieDetailToShow: .constant(nil))
            }
    }
        .foregroundColor(.white)
    }
}
