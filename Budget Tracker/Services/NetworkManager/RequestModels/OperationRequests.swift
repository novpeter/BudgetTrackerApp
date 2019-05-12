//
//  OperationRequests.swift
//  Budget Tracker
//
//  Created by Петр on 18/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import Foundation

struct OperationRequestBody: Codable {
    var payload: OperationRequestModel
    
    init(payload: OperationRequestModel) {
        self.payload = payload
    }
    
    enum CodingKeys: String, CodingKey {
        case payload = "Payload"
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(payload, forKey: .payload)
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        payload = try container.decode(OperationRequestModel.self, forKey: .payload)
    }
}

struct OperationRequestModel: Codable {
    var type: Int
    var clientId: String
    var userEmail: String
    var title: String
    var comment: String?
    var category: String
    var date: Date
    var sum: Double

    
    init(with operation: OperationModel) {
        type = operation.type
        clientId = operation.clientId
        userEmail = operation.userEmail
        title = operation.title
        comment = operation.comment
        category = operation.category
        date = operation.date
        sum = operation.sum
    }
    
    enum CodingKeys: String, CodingKey {
        case type = "Type"
        case clientId = "ClientId"
        case userEmail = "UserEmail"
        case title = "Title"
        case comment = "Comment"
        case category = "Category"
        case date = "Date"
        case sum = "Sum"
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(clientId, forKey: .clientId)
        try container.encode(type, forKey: .type)
        try container.encode(userEmail, forKey: .userEmail)
        try container.encode(title, forKey: .title)
        try container.encode(comment, forKey: .comment)
        try container.encode(category, forKey: .category)
        try container.encode(date, forKey: .date)
        try container.encode(sum, forKey: .sum)
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        clientId = try container.decode(String.self, forKey: .clientId)
        type = try container.decode(Int.self, forKey: .type)
        userEmail = try container.decode(String.self, forKey: .userEmail)
        title = try container.decode(String.self, forKey: .title)
        comment = try container.decode(String.self, forKey: .comment)
        category = try container.decode(String.self, forKey: .category)
        date = try container.decode(Date.self, forKey: .date)
        sum = try container.decode(Double.self, forKey: .sum)
    }
}
