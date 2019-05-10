//
//  OperationModel.swift
//  Budget Tracker
//
//  Created by Петр on 10/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import RealmSwift

@objcMembers
class OperationModel: Object {
    
    dynamic var clientId: String = String(describing: UUID.init())
    dynamic var serverId: String = String()
    dynamic var type: Int = 0
    dynamic var userEmail: String = String()
    dynamic var title: String = String()
    dynamic var category: String = String()
    dynamic var date: Date = Date()
    dynamic var sum: Double = 0.0
    dynamic var comment: String = String()
    
    override static func primaryKey() -> String? {
        return "clientId"
    }
}
