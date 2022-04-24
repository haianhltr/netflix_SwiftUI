//
//  GlobalHelper.swift
//  netflix
//
//  Created by Anh Le Truong on 4/21/22.
//

import Foundation
import SwiftUI

let exampleVideoURL = URL(string : "https://player.vimeo.com/external/371433846.sd.mp4?s=236da2f3c0fd273d2c6d9a064f3ae35579b2bbdf&profile_id=139&oauth2_token_id=57447761"
)!

let exampleImageURL = URL(string : "https://picsum.photos/300/104")!
let exampleImageURL2 = URL(string : "https://picsum.photos/300/102")!
let exampleImageURL3 = URL(string : "https://picsum.photos/300/101")!

var randomExampleImageURL : URL {
    return [exampleImageURL,exampleImageURL2, exampleImageURL3].randomElement() ?? exampleImageURL
}

let exampleTrailer1 = Trailer(name: "Season 3 Trailer", videoURL: exampleVideoURL, thumbnailImageURL: exampleImageURL)
let exampleTrailer2 = Trailer(name: "The Hero", videoURL: exampleVideoURL, thumbnailImageURL: exampleImageURL2)
let exampleTrailer3 = Trailer(name: "The Mysterious", videoURL: exampleVideoURL, thumbnailImageURL: exampleImageURL3)

//array of trailer
let exampleTrailers = [exampleTrailer1,exampleTrailer2,exampleTrailer3]


//episode
let episode1 = Episode(
    name: "Beginning and Endings 1",
    season :1,
    episodeNumber: 1,
    thumbnailImageURLString:  "https://picsum.photos/300/102",
    description: "WorldstarHipHop is home to everything entertainment & hip hop. The #1 urban outlet responsible for breaking the latest premiere music videos, exclusive artist content, entertainment stories, celebrity rumors, sports highlights, interviews, comedy skits, rap freestyles, crazy fights, eye candy models, the best viral videos & more.",
    length: 53,
    videoURL: exampleVideoURL)

let episode2 = Episode(
    name: "Beginning and Endings 2",
    season :1,
    episodeNumber: 2,
    thumbnailImageURLString:  "https://picsum.photos/300/103",
    description: "WorldstarHipHop is home to everything entertainment & hip hop. The #1 urban outlet responsible for breaking the latest premiere music videos, exclusive artist content, entertainment stories, celebrity rumors, sports highlights, interviews, comedy skits, rap freestyles, crazy fights, eye candy models, the best viral videos & more.",
    length: 55,
    videoURL: exampleVideoURL)

let episode3 = Episode(
    name: "Beginning and Endings 3",
    season :1,
    episodeNumber: 3,
    thumbnailImageURLString:  "https://picsum.photos/300/101",
    description: "WorldstarHipHop is home to everything entertainment & hip hop. The #1 urban outlet responsible for breaking the latest premiere music videos, exclusive artist content, entertainment stories, celebrity rumors, sports highlights, interviews, comedy skits, rap freestyles, crazy fights, eye candy models, the best viral videos & more.",
    length: 57,
    videoURL: exampleVideoURL)

let episode4 = Episode(
    name: "Beginning and Endings 4",
    season :2,
    episodeNumber: 1,
    thumbnailImageURLString:  "https://picsum.photos/300/107",
    description: "WorldstarHipHop is home to everything entertainment & hip hop. The #1 urban outlet responsible for breaking the latest premiere music videos, exclusive artist content, entertainment stories, celebrity rumors, sports highlights, interviews, comedy skits, rap freestyles, crazy fights, eye candy models, the best viral videos & more.",
    length: 53,
    videoURL: exampleVideoURL)

let episode5 = Episode(
    name: "Beginning and Endings 5",
    season :2,
    episodeNumber: 2,
    thumbnailImageURLString:  "https://picsum.photos/300/105",
    description: "WorldstarHipHop is home to everything entertainment & hip hop. The #1 urban outlet responsible for breaking the latest premiere music videos, exclusive artist content, entertainment stories, celebrity rumors, sports highlights, interviews, comedy skits, rap freestyles, crazy fights, eye candy models, the best viral videos & more.",
    length: 55,
    videoURL: exampleVideoURL)

let episode6 = Episode(
    name: "Beginning and Endings 6",
    season :2,
    episodeNumber: 3,
    thumbnailImageURLString:  "https://picsum.photos/300/104",
    description: "WorldstarHipHop is home to everything entertainment & hip hop. The #1 urban outlet responsible for breaking the latest premiere music videos, exclusive artist content, entertainment stories, celebrity rumors, sports highlights, interviews, comedy skits, rap freestyles, crazy fights, eye candy models, the best viral videos & more.",
    length: 57,
    videoURL: exampleVideoURL)



var allExampleEpisodes = [episode1,episode2,episode3,episode4,episode5,episode6] 



//movie
let exampleMovie1 = Movie(
    id: UUID().uuidString,
    name:"DARK",
    thumbnailURL:URL(string:"https://picsum.photos/200/300")!,
    categories: ["Dystopian", "Exciting", "Suspenseful", "Sci-Fi TV"],
    year: 2020,
    rating: "TV-MA",
    numberOfSeasons: 2,
    defaultEpisodeInfo: exampleEpisodeInfo1,
    creators: "Cactus Jack Records",
    cast: "Louis Hoffman, Oliver Heldens, Jordan Micheal",
    moreLikeThisMovies: [exampleMovie2,exampleMovie3,exampleMovie4,exampleMovie5,exampleMovie6],
    episodes: allExampleEpisodes,
    trailers: exampleTrailers)

let exampleMovie2 = Movie(
    id: UUID().uuidString,
    name:"Travelers",
    thumbnailURL: URL(string:"https://picsum.photos/200/302")!,
    categories: ["Dystopian", "Exciting", "Suspenseful", "Sci-Fi TV"],
    year:2020,
    rating: "TV-MA",
    numberOfSeasons: 2,
    defaultEpisodeInfo: exampleEpisodeInfo1,
    creators: "Cactus Jack Records",
    cast: "Louis Hoffman, Oliver Heldens, Jordan Micheal",
    moreLikeThisMovies: [], trailers: exampleTrailers)


let exampleMovie3 = Movie(
    id: UUID().uuidString,
    name:"Community",
    thumbnailURL: URL(string:"https://picsum.photos/200/301")!,
    categories: ["Dystopian", "Exciting", "Suspenseful", "Sci-Fi TV"],
    year:2020,
    rating: "TV-MA",
    numberOfSeasons: 3,
    defaultEpisodeInfo: exampleEpisodeInfo1,
    creators: "Cactus Jack Records",
    cast: "Louis Hoffman, Oliver Heldens, Jordan Micheal",
    moreLikeThisMovies: [], trailers: exampleTrailers)


let exampleMovie4 = Movie(
    id: UUID().uuidString,
    name:"Alone",
    thumbnailURL: URL(string:"https://picsum.photos/200/303")!,
    categories: ["Dystopian", "Exciting", "Suspenseful", "Sci-Fi TV"],
    year:2020,
    rating:"TV-MA",
    numberOfSeasons: 4,
    defaultEpisodeInfo: exampleEpisodeInfo1,
    creators: "Cactus Jack Records",
    cast: "Louis Hoffman, Oliver Heldens, Jordan Micheal",
    moreLikeThisMovies: [], promotionHeadline: "New episode coming Soon", trailers: exampleTrailers)


let exampleMovie5 = Movie(
    id: UUID().uuidString,
    name:"Hannibal",
    thumbnailURL: URL(string:"https://picsum.photos/200/304")!,
    categories: ["Dystopian", "Exciting", "Suspenseful", "Sci-Fi TV"],
    year:2020,
    rating: "TV-MA",
    numberOfSeasons: 5,
    defaultEpisodeInfo: exampleEpisodeInfo1,
    creators: "Cactus Jack Records",
    cast: "Louis Hoffman, Oliver Heldens, Jordan Micheal",
    moreLikeThisMovies: [], trailers: exampleTrailers
)


let exampleMovie6 = Movie(
    id: UUID().uuidString,
    name:"After Life",
    thumbnailURL: URL(string:"https://picsum.photos/200/305")!,
    categories: ["Dystopian", "Exciting", "Suspenseful", "Sci-Fi TV"],
    year:2020,
    rating: "TV-MA",
    numberOfSeasons: 6,
    defaultEpisodeInfo: exampleEpisodeInfo1,
    creators: "Cactus Jack Records",
    cast: "Louis Hoffman, Oliver Heldens, Jordan Micheal",
    moreLikeThisMovies: [],
    promotionHeadline: "Watch Season 6 Now", trailers: exampleTrailers
    )



var exampleMovies: [Movie] 
{
    return [exampleMovie1,exampleMovie2,exampleMovie3,exampleMovie4,exampleMovie5,exampleMovie6].shuffled()

}


let exampleEpisodeInfo1 = CurrentEpisodeInfo(episodeName: "Fears of a Clown", description: "Bart goes to prankster rehab after a clown-mask prank terrifies the town and destroys Krusty's career. A tortured Krusty then tries his hand at serious drama with a regional theater company."
, season: 29, episode: 14)

extension LinearGradient
{
    static let blackOpacityGradient = LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.0), Color.black.opacity(0.95)]), startPoint: .top, endPoint: .bottom)
}


extension String{
    func widthOfString(usingFont font: UIFont) -> CGFloat{
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.width
    }
}



extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
