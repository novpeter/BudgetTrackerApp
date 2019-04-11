//
//  UserModel.swift
//  Budget Tracker
//
//  Created by Петр on 10/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import RealmSwift

@objcMembers
class UserModel: Object {
    
    dynamic var id = String(describing: UUID.init())
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
