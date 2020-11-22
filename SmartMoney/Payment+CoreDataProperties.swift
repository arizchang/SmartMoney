//
//  Payment+CoreDataProperties.swift
//  SmartMoney
//
//  Created by Ariz Chang on 11/22/20.
//  Copyright © 2020 Ariz Chang. All rights reserved.
//
//

import Foundation
import CoreData


extension Payment {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Payment> {
        return NSFetchRequest<Payment>(entityName: "Payment")
    }

    @NSManaged public var amount: Double
    @NSManaged public var category: String?
    @NSManaged public var user: User?

}
