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
    @NSManaged public var categoryList: NSSet?

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

// MARK: Generated accessors for categoryList
extension User {

    @objc(addCategoryListObject:)
    @NSManaged public func addToCategoryList(_ value: Category)

    @objc(removeCategoryListObject:)
    @NSManaged public func removeFromCategoryList(_ value: Category)

    @objc(addCategoryList:)
    @NSManaged public func addToCategoryList(_ values: NSSet)

    @objc(removeCategoryList:)
    @NSManaged public func removeFromCategoryList(_ values: NSSet)

}
