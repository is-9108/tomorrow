//
//  Task.swift
//  tomorowTodo
//
//  Created by Shota Ishii on 2020/07/09.
//  Copyright © 2020 is. All rights reserved.
//

import Foundation
import RealmSwift

class Task:Object{
    
    @objc dynamic var id = 0
    
    @objc dynamic var title = ""
    
    @objc dynamic var rank = 0
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
