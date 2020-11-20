//
//  UserModel.swift
//  SmartMoney
//
//  Created by Ariz Chang on 11/19/20.
//  Copyright © 2020 Ariz Chang. All rights reserved.
//

import Foundation
import CoreData

class UserModel {
    
    let managedObjectContext:NSManagedObjectContext
    var userList = [User]()
    
    init(_ context: NSManagedObjectContext) {
        managedObjectContext = context
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        userList = ((try? managedObjectContext.fetch(fetchRequest)) as? [User])!
    }
    
    func getCount() -> Int {
        return userList.count
    }
    
    func add(_ username: String, _ password: String, _ picture: Data) {
        if !isDuplicate(username) {
            let ent = NSEntityDescription.entity(forEntityName: "User", in: self.managedObjectContext)
            let newUser = User(entity: ent!, insertInto: self.managedObjectContext)
            newUser.username = username
            newUser.password = password
            newUser.picture = picture
            
            do {
                try managedObjectContext.save()
            } catch {}
            print(newUser)
        }
        else {
            print("That username is taken!")
        }

    }
    
    func isDuplicate(_ username: String) -> Bool {
        for user in userList {
            if username == user.username {
                return true
            }
        }
        return false
    }
}
