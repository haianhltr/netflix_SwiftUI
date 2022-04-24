//
//  VideoPreviewImage.swift
//  netflix
//
//  Created by Anh Le Truong on 4/22/22.
//

import SwiftUI
import Kingfisher

struct VideoPreviewImage: View {
    
    
    var imageURL : URL
    var videoURL : URL
    
    @State private var showingVideoPlayer = false
    
    var body: some View {
        ZStack{
            KFImage(imageURL).resizable()
                .aspectRatio(contentMode: .fill)
            
            
                Button(action:
                {
                    //action
                    showingVideoPlayer = true
                }, label: {
                    Image(systemName: "play.circle")
                        .foregroundColor(.white)
                        .font(.system(size: 40))
                })
                .sheet(isPresented: $showingVideoPlayer, content: {
                    //video is being shown when clicked
                    SwiftUIVideoView(url: videoURL)
                })
            
        }
    }
}

struct VideoPreviewImage_Previews: PreviewProvider {
    static var previews: some View {
        VideoPreviewImage(imageURL: exampleImageURL, videoURL: exampleVideoURL)
    }
}
