//
//  HomeView.swift
//  netflix
//
//  Created by Anh Le Truong on 4/20/22.
//

import SwiftUI
import AVFoundation

struct HomeView: View {
    var vm = HomeVM()
    
    let screen = UIScreen.main.bounds
    
    @State private var movieDetailToShow: Movie? = nil
    
    //if choose TVSHows or Movies it will be passed to HomeStack in line 49
    @State private var topRowSelection: HomeTopRow = .home
    @State private var homeGenre: HomeGenre = .AllGenres
    
    @State private var showGenreSelection = false
    @State private var showTopRowSelection = false
    
    var body: some View {
        
        ZStack{
            Color.black.edgesIgnoringSafeArea(.all)
            
            //main vStack
            ScrollView(showsIndicators: false) {
                LazyVStack {
                    
                    //top
                    TopRowButtons(topRowSelection: $topRowSelection, homeGenre: $homeGenre,
                                  showGenreSelection: $showGenreSelection, showTopRowSelection: $showTopRowSelection)
                    
                    
                    //would say slider
                    TopMoviePreview(movie: exampleMovie1).frame(width: screen.width)
                        .padding(.top,-110)
                        .zIndex(-1)
                    
                    
                    
                    
                    //all the categories
                    //pass variables to HomeStack.swift
                    HomeStack(vm: vm, topRowSelection: topRowSelection, selectedGenre: homeGenre, movieDetailToShow: $movieDetailToShow)
                }
            }
            
            
            //on top of main screen
            if movieDetailToShow != nil{
                MovieDetail(movie: movieDetailToShow!, movieDetailToShow: $movieDetailToShow)
                    .animation(Animation.easeInOut(duration: 0.5))
                    .transition(.opacity)
            }
            
            if showTopRowSelection {
                Group {
                    Color.black.opacity(0.9)
                    VStack (spacing : 40){
                        Spacer()
                        ForEach(HomeTopRow.allCases, id: \.self){
                            topRow in
                            Button(action: {
                                topRowSelection = topRow
                                showTopRowSelection = false
                            }, label: {
                                
                                if topRow == topRowSelection{
                                    Text("\(topRow.rawValue)").bold()
                                }
                                else {
                                    Text("\(topRow.rawValue)").foregroundColor(.gray)
                                }
                                
                            })
                        }
                        
                        Spacer()
                        Button(action: {
                            showTopRowSelection = false
                        }, label: {
                            Image(systemName: "xmark.circle.fill")
                                .font(.system(size: 40))
                        })
                        .padding(.bottom,30)
                    }
                }
                .edgesIgnoringSafeArea(.all)
                .font(.title2)
            }
            
            
            
            if showGenreSelection {
                Group {
                    Color.black.opacity(0.9)
                    VStack (spacing : 40){
                        Spacer()
                        
                        ScrollView{
                            ForEach(vm.allGenre, id: \.self){
                                genre in
                                Button(action: {
                                    homeGenre = genre
                                    showGenreSelection = false
                                }, label: {
                                    
                                    if genre == homeGenre{
                                        Text("\(genre.rawValue)").bold()
                                    }
                                    else {
                                        Text("\(genre.rawValue)").foregroundColor(.gray)
                                    }
                                    
                                }).padding(.bottom, 40)
                            }
                        }
                        
                        Spacer()
                        Button(action: {
                           showGenreSelection = false
                        }, label: {
                            Image(systemName: "xmark.circle.fill")
                                .font(.system(size: 40))
                        })
                        .padding(.bottom,30)
                    }
                }
                .edgesIgnoringSafeArea(.all)
                .font(.title2)
            }
            
            
            
            
        }
        .foregroundColor(.white)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct TopRowButtons: View {
    
    
    @Binding var topRowSelection: HomeTopRow
    @Binding var homeGenre :HomeGenre
    
    
    @Binding var showGenreSelection: Bool
    @Binding var showTopRowSelection: Bool
    
    var body: some View {
        switch topRowSelection {
        case .home:
            HStack{
                Button(action: {
                    topRowSelection = .home
                    
                }, label: {
                    
                    Image("netflix_logo")
                        .resizable().scaledToFit().frame(width:50)
                }).buttonStyle(PlainButtonStyle())
                
                Spacer()
                
                
                Button(action: {
                    topRowSelection = .tvShows
                }, label: {
                    
                    Text("TV Shows")
                }).buttonStyle(PlainButtonStyle())
                
                Spacer()
                Button(action: {
                    topRowSelection = .movies
                }, label: {
                    
                    Text("Movies")
                }).buttonStyle(PlainButtonStyle())
                Spacer()
                Button(action: {
                    topRowSelection = .myLists
                }, label: {
                    
                    Text("My List")
                }).buttonStyle(PlainButtonStyle())
                
                
            }
            .padding(.leading,10)
            .padding(.trailing,30)
            
            
            
        case .myLists, .tvShows, .movies:
            HStack{
                Button(action: {
                    topRowSelection = .home
                    
                }, label: {
                    
                    Image("netflix_logo")
                        .resizable().scaledToFit().frame(width:50)
                }).buttonStyle(PlainButtonStyle())
                
                HStack (spacing : 20){
                    
                    Button(action: {
                        showTopRowSelection = true
                    }, label: {
                        
                        HStack {
                            Text(topRowSelection.rawValue).font(.system(size: 18))
                            Image(systemName: "triangle.fill").rotationEffect(.degrees(180), anchor: .center).font(.system(size: 10))
                        }
                    }).buttonStyle(PlainButtonStyle())
                    
                    
                    Button(action: {
                        showGenreSelection = true
                    }, label: {
                        
                        HStack {
                            Text(homeGenre.rawValue).font(.system(size: 12))
                            Image(systemName: "triangle.fill").rotationEffect(.degrees(180), anchor: .center).font(.system(size: 10))
                        }
                    }).buttonStyle(PlainButtonStyle())
                    Spacer()
                    
                }
                
            }
            .padding(.leading,30)
            .padding(.trailing,30)
            
        }
        
        
    }
}


enum HomeTopRow: String, CaseIterable{
    
    case home = "Home"
    case tvShows = "TV Shows"
    case movies = "Movies"
    case myLists = "My List"
}

enum HomeGenre: String {
    case AllGenres
    case Action
    case Comedy
    case Horror
    case Thriller
}

