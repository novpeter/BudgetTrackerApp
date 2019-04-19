//
//  UserRequestModel.swift
//  Budget Tracker
//
//  Created by Петр on 18/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

struct SignInRequestBody: Codable {
    var authType: String
    var payload: SignInUser
    
    init(authType: String, payload: SignInUser) {
        self.authType = authType
        self.payload = payload
    }
    
    enum CodingKeys: String, CodingKey {
        case authType = "AuthType"
        case payload = "Payload"
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(authType, forKey: .authType)
        try container.encode(payload, forKey: .payload)
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        authType = try container.decode(String.self, forKey: .authType)
        payload = try container.decode(SignInUser.self, forKey: .payload)
    }
}

struct SignInUser: Codable {
    var fullname: String?
    var email: String
    var token: String?
    var password: String?
    
    init(fullName: String?, email: String, token: String?, password: String?) {
        self.fullname = fullName
        self.email = email
        self.token = token
        self.password = password
    }
    
    enum CodingKeys: String, CodingKey {
        case fullname = "FullName"
        case email = "Email"
        case token = "Token"
        case password = "Password"
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(fullname, forKey: .fullname)
        try container.encode(email, forKey: .email)
        try container.encode(token, forKey: .token)
        try container.encode(password, forKey: .password)
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        fullname = try container.decode(String.self, forKey: .fullname)
        email = try container.decode(String.self, forKey: .email)
        token = try container.decode(String.self, forKey: .token)
        password = try container.decode(String.self, forKey: .password)
    }
}


struct SignUpRequestBody: Codable {
    var payload: SignUpUser
    
    enum CodingKeys: String, CodingKey {
        case payload = "Payload"
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(payload, forKey: .payload)
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        payload = try container.decode(SignUpUser.self, forKey: .payload)
    }
}

struct SignUpUser: Codable {
    var name: String
    var email: String
    var password: String
    
    enum CodingKeys: String, CodingKey {
        case name = "Name"
        case email = "Email"
        case password = "Password"
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(email, forKey: .email)
        try container.encode(password, forKey: .password)
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        email = try container.decode(String.self, forKey: .email)
        password = try container.decode(String.self, forKey: .password)
    }
}
