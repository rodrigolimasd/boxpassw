//
//  PasswordData+CoreDataProperties.swift
//  boxpassw
//
//  Created by Rodrigo Lima on 08/04/23.
//
//

import Foundation
import CoreData


extension PasswordData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PasswordData> {
        return NSFetchRequest<PasswordData>(entityName: "PasswordData")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var domain: String?
    @NSManaged public var username: String?
    @NSManaged public var password: String?
    @NSManaged public var active: Bool

}

extension PasswordData : Identifiable {

}
