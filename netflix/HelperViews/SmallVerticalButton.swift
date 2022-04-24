//
//  SmallVerticalButton.swift
//  netflix
//
//  Created by Anh Le Truong on 4/21/22.
//

import SwiftUI

struct SmallVerticalButton: View {
    
    var text :String
    var isOnImage : String
    var isOffImage : String
    var isOn: Bool
    
    //set image on or off (pass to the system)
    var imageName: String {
        if isOn{
            return isOnImage
        }
        else{
            return isOffImage
        }
    }
    
    var action: ()-> Void
    
    var body: some View {
        Button(action:{
            //action
            action()
        },label: {
            VStack{
             Image(systemName: imageName)
                    .foregroundColor(.white)
                
                
                Text(text).foregroundColor(.white).font(.system(size: 14)).bold()
            }
        })
    }
}

struct SmallVerticalButton_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color.black
                .edgesIgnoringSafeArea(.all)
            SmallVerticalButton(text: "My List", isOnImage: "checkmark", isOffImage: "plus", isOn: true){ print("Tapped")}
    }
    }
}
