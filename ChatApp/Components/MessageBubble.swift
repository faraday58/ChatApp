//
//  MessageBubble.swift
//  ChatApp
//
//  Created by Armando Rodríguez on 10/08/23.
//

import Foundation
import SwiftUI

struct MessageBubble: View {
    var message: Message
    
    var body: some View{
        
        VStack{
            HStack{
                Text(message.text)
                    .padding()
                    .background(
                        message.received ? .gray :Color("ColorApp"))
                    .cornerRadius(30, corners: [.topLeft,.topRight, message.received ? .bottomRight : .bottomLeft  ])
            }
            .frame(maxWidth: 300,alignment: .trailing)
            Text("\(message.timestamp.formatted(.dateTime.hour().minute()))")
                .font(.caption2)
                .foregroundColor(.gray)
                .padding(.leading, 25)
        }
        .frame(
            maxWidth: .infinity, alignment: .trailing
        )
        
        
    }
    
    
}


struct MessageBubble_Previews: PreviewProvider{
    static var previews: some View{
        MessageBubble(message: Message(id: "abc", timestamp: Date(), text: "Este es un mensaje", received: true))
    }
    
}
