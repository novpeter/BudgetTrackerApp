//
//  CRUDResponse.swift
//  Budget Tracker
//
//  Created by Петр on 07/05/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import Foundation

struct AddingResponse: Codable {
    var message: String
    var payload: ServerIdPayload
    
    enum CodingKeys: String, CodingKey {
        case message = "Message"
        case payload = "Payload"
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(message, forKey: .message)
        try container.encode(payload, forKey: .payload)
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        message = try container.decode(String.self, forKey: .message)
        payload = try container.decode(ServerIdPayload.self, forKey: .payload)
    }
}

struct ServerIdPayload: Codable {
    var serverId: String
    var userEmail: String
    
    enum CodingKeys: String, CodingKey {
        case serverId = "ServerId"
        case userEmail = "UserEmail"
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(serverId, forKey: .serverId)
        try container.encode(userEmail, forKey: .userEmail)
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        serverId = try container.decode(String.self, forKey: .serverId)
        userEmail = try container.decode(String.self, forKey: .userEmail)
    }
}
