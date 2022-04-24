//
//  Episode.swift
//  netflix
//
//  Created by Anh Le Truong on 4/21/22.
//

import Foundation

    
struct Episode : Identifiable{
    var id = UUID().uuidString
    
    var name : String
    var season : Int
    
    //added in 16
    var episodeNumber: Int
    
    
    var thumbnailImageURLString: String
    var description: String
    var length: Int
    
    
    
    
    //added in 16
    var videoURL: URL 
    
    var thumbnailURL: URL {
        return URL(string: thumbnailImageURLString)!
    }
}

