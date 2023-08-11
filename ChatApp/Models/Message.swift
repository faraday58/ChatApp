//
//  Message.swift
//  ChatApp
//
//  Created by Armando Rodríguez on 10/08/23.
//

import Foundation

struct Message: Codable {
    var id: String
    var timestamp: Date
    var text: String
    var received: Bool
}
