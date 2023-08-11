//
//  ContentView.swift
//  ChatApp
//
//  Created by Armando Rodríguez on 10/08/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var messageManager = MessagesManager()
    
    var body: some View {
        ZStack{
            Color("ColorApp").ignoresSafeArea()
            VStack{
                TitleRow()
                ScrollViewReader { proxy in
                    ScrollView{
                        ForEach(messageManager.messages, id: \.id ){
                            message in
                            MessageBubble(message: message)
                        }
                        
                        
                    }.padding(.top,10)
                        .background(.white)
                    .cornerRadius(30, corners: [.topLeft,.topRight])
                    .onChange(of: messageManager.lastMessageID) { id in
                        withAnimation {
                            proxy.scrollTo(id,anchor: .bottom)
                        }
                    }
                }
                    
                
                MessageField()
                    .environmentObject(messageManager)
                
            }
            
            
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
