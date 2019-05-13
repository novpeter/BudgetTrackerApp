//
//  CRUDResponse.swift
//  Budget Tracker
//
//  Created by Петр on 07/05/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import Foundation

// MARK: - Add

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

// MARK: - Get

struct GetOperationsResponse: Codable {
    var message: String
    var payload: [OperationPayload]
    
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
        payload = try container.decode([OperationPayload].self, forKey: .payload)
    }
}

struct GetOperationResponse: Codable {
    var message: String
    var payload: OperationPayload
    
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
        payload = try container.decode(OperationPayload.self, forKey: .payload)
    }
}

struct OperationPayload: Codable {
    var serverId: Int
    var clientId: String
    var userEmail: String
    var type: Int
    var title: String
    var comment: String
    var category: String
    var date: String
    var sum: Double
    
    enum CodingKeys: String, CodingKey {
        case serverId = "ServerId"
        case clientId = "ClientId"
        case userEmail = "UserEmail"
        case type = "Type"
        case title = "Title"
        case comment = "Comment"
        case category = "Category"
        case date = "Date"
        case sum = "Sum"
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(serverId, forKey: .serverId)
        try container.encode(clientId, forKey: .clientId)
        try container.encode(userEmail, forKey: .userEmail)
        try container.encode(type, forKey: .type)
        try container.encode(title, forKey: .title)
        try container.encode(comment, forKey: .comment)
        try container.encode(category, forKey: .category)
        try container.encode(date, forKey: .date)
        try container.encode(sum, forKey: .sum)
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        serverId = try container.decode(Int.self, forKey: .serverId)
        clientId = try container.decode(String.self, forKey: .clientId)
        userEmail = try container.decode(String.self, forKey: .userEmail)
        type = try container.decode(Int.self, forKey: .type)
        title = try container.decode(String.self, forKey: .title)
        comment = try container.decode(String.self, forKey: .comment)
        category = try container.decode(String.self, forKey: .category)
        date = try container.decode(String.self, forKey: .date)
        sum = try container.decode(Double.self, forKey: .sum)
    }
}
