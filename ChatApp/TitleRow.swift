//
//  TitleRow.swift
//  ChatApp
//
//  Created by Armando Rodríguez on 10/08/23.
//

import SwiftUI

struct TitleRow: View{
    var imageURL = URL(string: "https://images.pexels.com/photos/733767/pexels-photo-733767.jpeg")
    var name: String = "Armando R"
    
    var body: some View{
        
        HStack(spacing: 20){
            AsyncImage(url: imageURL!) { image in
                image
                    .resizable()
                    .frame(width: 50, height: 50)
                    .cornerRadius(50)
            } placeholder: {
                ProgressView()
            }
            Text(name)
                .font(.largeTitle)
                .bold()
            Spacer()
            Image(systemName: "video.fill")
                .foregroundColor(Color ("ColorApp"))
                .padding()
                .background(.black)
                .cornerRadius(50)
        }.padding()
        
    }
}

struct TitleRow_Previews: PreviewProvider{
    static var previews: some View{
        TitleRow()
    }
}
