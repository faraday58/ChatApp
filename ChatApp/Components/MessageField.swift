//
//  MessageField.swift
//  ChatApp
//
//  Created by Armando Rodríguez on 11/08/23.
//

import SwiftUI

struct MessageField: View {
    @EnvironmentObject var messagesManager: MessagesManager
    @State  private var message = ""
    @FocusState private var kbFocused
    
    
    var body: some View {
        HStack {
            CustomTextField(placeholder: Text("Escribir mensaje"), text: $message)
                .focused($kbFocused)
            Button {
                messagesManager.sendMessage(message: message)
            } label: {
                Image(systemName: "paperplane.fill")
                    .foregroundColor(.white)
                    .padding(10)
                    .background(message.isEmpty ? Color("Peach") : .blue)
                    .cornerRadius(50)
                    .scaleEffect(message.isEmpty ? 0.95 : 1.0)
                    .animation(.easeInOut, value: message.isEmpty)
                    
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
        .background(Color("Gray"))
        .cornerRadius(50)
        .padding()
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                Button("Hecho") {
                    kbFocused = false
                }
            }
        }
    }
}

struct CustomTextField: View {
    var placeholder: Text
    @Binding var text: String
    var editingChanged: (Bool) -> () = {_ in}
    var  commit: () -> () = {}

    var body: some View {
        ZStack (alignment: .leading) {
            if text.isEmpty {
                placeholder
                    .opacity(0.5)
            }
            TextField("", text: $text, onEditingChanged:
            editingChanged, onCommit: commit)
        }
    }
}

struct MessageField_Previews: PreviewProvider {
    static var previews: some View {
        MessageField()
    }
}
