

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
