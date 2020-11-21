//
//  User+CoreDataProperties.swift
//  SmartMoney
//
//  Created by Ariz Chang on 11/21/20.
//  Copyright © 2020 Ariz Chang. All rights reserved.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var password: String?
    @NSManaged public var picture: Data?
    @NSManaged public var username: String?

}
