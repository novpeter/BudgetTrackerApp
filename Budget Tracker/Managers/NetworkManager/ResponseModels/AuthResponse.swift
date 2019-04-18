//
//  AuthResponse.swift
//  Budget Tracker
//
//  Created by Петр on 18/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

struct AuthResponse: Codable {
    var message: String
    var payload: TokenPayload
    
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
        payload = try container.decode(TokenPayload.self, forKey: .payload)
    }
}

struct TokenPayload: Codable {
    var sessionToken: String
    
    enum CodingKeys: String, CodingKey {
        case sessionToken = "SessionToken"
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(sessionToken, forKey: .sessionToken)
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        sessionToken = try container.decode(String.self, forKey: .sessionToken)
    }
}
