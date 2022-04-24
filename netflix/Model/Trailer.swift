//
//  Trailer.swift
//  netflix
//
//  Created by Anh Le Truong on 4/22/22.
//

import Foundation


struct Trailer: Identifiable, Hashable {
    var id: String = UUID().uuidString
    var name: String
    //video
    var videoURL: URL
    var thumbnailImageURL: URL
    
    
}
