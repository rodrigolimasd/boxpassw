//
//  Item+CoreDataProperties.swift
//  boxpassw
//
//  Created by Rodrigo Lima on 08/04/23.
//
//

import Foundation
import CoreData


extension Item {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item")
    }

    @NSManaged public var timestamp: Date?

}

extension Item : Identifiable {

}
