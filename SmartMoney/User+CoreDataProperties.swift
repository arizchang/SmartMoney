//
//  User+CoreDataProperties.swift
//  SmartMoney
//
//  Created by Ariz Chang on 11/22/20.
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
    @NSManaged public var paymentList: NSSet?

}

// MARK: Generated accessors for paymentList
extension User {

    @objc(addPaymentListObject:)
    @NSManaged public func addToPaymentList(_ value: Payment)

    @objc(removePaymentListObject:)
    @NSManaged public func removeFromPaymentList(_ value: Payment)

    @objc(addPaymentList:)
    @NSManaged public func addToPaymentList(_ values: NSSet)

    @objc(removePaymentList:)
    @NSManaged public func removeFromPaymentList(_ values: NSSet)

}
