//
//  Password.swift
//  boxpassw
//
//  Created by Rodrigo Lima on 07/04/23.
//

import Foundation
import CoreData

class Password: NSManagedObject, Identifiable {
    var id: String {
        UUID().uuidString
    }
    @NSManaged var name: String
    @NSManaged var username: String
    @NSManaged var password: String
    @NSManaged var active: Bool
    
    static func create(name: String, username: String, _password: String, active: Bool) -> Password {
        let password = Password()
        password.name = name
        password.username = username
        password.password = _password
        password.active = active
        return password
    }
    
    func update(name: String, username: String, password: String, active: Bool) {
        self.name = name
        self.username = username
        self.password = password
        self.active = active
    }
    
}
