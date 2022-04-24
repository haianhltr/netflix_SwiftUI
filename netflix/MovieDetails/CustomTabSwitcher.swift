//
//  CustomTabSwitcher.swift
//  netflix
//
//  Created by Anh Le Truong on 4/22/22.
//

import SwiftUI

struct CustomTabSwitcher: View {
    
    @State private var currentTab: CustomTab = .episodes
    
  
    
    var tabs : [CustomTab]
    var movie : Movie
    @Binding var showSeasonPicker : Bool
    @Binding var selectedSeason  : Int
    
    func widthForTab(_ tab: CustomTab) -> CGFloat{
        let string = tab.rawValue
        return string.widthOfString(usingFont: .systemFont(ofSize: 16,weight: .bold))
    }
    
    
    var body: some View {
        VStack{
            //SCrollable picker
            ScrollView(.horizontal,showsIndicators: false)
            {
                HStack (spacing: 20){
                    ForEach(tabs,id: \.self){
                        tab in
                        VStack {
                            //Red bar
                            Rectangle().frame(width: widthForTab(tab),height: 6)
                                .foregroundColor(
                                    tab == currentTab ? Color.red : Color.clear
                                )
                            
                            //red bar ontop
                            Button(action: {
                                currentTab = tab
                            }, label: {
                                Text(tab.rawValue).font(.system(size:16,weight: .bold))
                                    .foregroundColor(tab == currentTab ? Color.white : Color.gray)
                            })
                            .buttonStyle(PlainButtonStyle())
                            .frame(width: widthForTab(tab),height: 30)
                         
                        }
                }
            }
            }
            
            
            //selected view
            switch currentTab {
            case .episodes:
               
                EpisodesView(episodes: movie.episodes ?? [], showSeasonPicker: $showSeasonPicker, selectedSeason: $selectedSeason)
                
            case .trailers:
            
                TrailerList(trailers : movie.trailers)
            case .more:
                MoreLikeThis(movies : movie.moreLikeThisMovies)
            }
            
            
        }.foregroundColor(.white)
        
    }
}

enum CustomTab : String {
    case episodes = "EPISODE"
    case trailers = "TRAILERS & MORES"
    case more = "MORE LIKE THIS"
}


struct CustomTabSwitcher_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black.ignoresSafeArea(.all)
            CustomTabSwitcher(tabs : [.episodes,.trailers,.more], movie : exampleMovie1, showSeasonPicker: .constant(false), selectedSeason: .constant(1))
        }
    }
}

