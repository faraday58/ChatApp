//
//  MessageManager.swift
//  ChatApp
//
//  Created by Armando Rodríguez on 11/08/23.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class MessagesManager: ObservableObject{
    @Published private(set) var lastMessageID = ""
    @Published private(set) var messages: [Message] = []
    
    let db = Firestore.firestore()
    
    init() {
        getMessages()
    }
    
    func getMessages() {
            db.collection("messages").addSnapshotListener { snapshot, error in
                // 1. Ver si hay error
                guard let documents = snapshot?.documents else {
                    print("Error al traer los documentos: \(String(describing: error?.localizedDescription))")
                    return
                }
                // 2. Llenar arreglo de mensajes
                self.messages = documents.compactMap { document -> Message? in
                    do {
                        return try document.data(as: Message.self)
                    } catch let error {
                        print("ERROR al decodificar el documento \(error.localizedDescription)")
                        return nil
                    }
                }
                //3. Ordenarlos por fecha
                
                self.messages.sort{ m1 , m2 in
                    m1.timestamp < m2.timestamp
                }
                
                if let messageID = self.messages.last?.id{
                    self.lastMessageID = messageID
                }
            }
        }
    
    
    func sendMessage(message: String){
        do{
            let newMessage = Message(id: "\(UUID())", timestamp: Date(), text: message, received: false)
            try db.collection("messages").document().setData(from: newMessage)
            
        }catch let error
        {
            print("Error al subir en Firestor \(error.localizedDescription)")
        }
        
        
    }
    
 }
