

import Foundation
import RealmSwift

class Task:Object{
    
    @objc dynamic var id: Int = 0
    
    @objc dynamic var title: String = ""
    
    @objc dynamic var rank: Int = 0
    
    @objc dynamic var deadline: Date = Date()
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
