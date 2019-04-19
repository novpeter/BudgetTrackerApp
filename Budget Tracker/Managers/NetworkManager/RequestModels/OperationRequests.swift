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
    var type: String
    var userEmail: String
    var title: String
    var comment: String?
    var category: String
    var date: Date
    var sum: Double

    
    init(type: String, userEmail: String, title: String, comment: String?, category: String, date: Date, sum: Double) {
        self.type = type
        self.userEmail = userEmail
        self.title = title
        self.comment = comment
        self.category = category
        self.date = date
        self.sum = sum
    }
    
    enum CodingKeys: String, CodingKey {
        case type = "Type"
        case userEmail = "UserEmail"
        case title = "Title"
        case comment = "Comment"
        case category = "Category"
        case date = "Date"
        case sum = "Sum"
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
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
        type = try container.decode(String.self, forKey: .type)
        userEmail = try container.decode(String.self, forKey: .userEmail)
        title = try container.decode(String.self, forKey: .title)
        comment = try container.decode(String.self, forKey: .comment)
        category = try container.decode(String.self, forKey: .category)
        date = try container.decode(Date.self, forKey: .date)
        sum = try container.decode(Double.self, forKey: .sum)
    }
}
