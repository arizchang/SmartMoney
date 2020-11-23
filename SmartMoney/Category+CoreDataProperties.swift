//
//  Category+CoreDataProperties.swift
//  SmartMoney
//
//  Created by Ariz Chang on 11/22/20.
//  Copyright © 2020 Ariz Chang. All rights reserved.
//
//

import Foundation
import CoreData


extension Category {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Category> {
        return NSFetchRequest<Category>(entityName: "Category")
    }

    @NSManaged public var currentAmount: Double
    @NSManaged public var limitAmount: Double
    @NSManaged public var categoryName: String?
    @NSManaged public var user: User?

}
