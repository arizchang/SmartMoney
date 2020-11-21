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
    
    func getUser(_ name: String) -> User? {
        for user in userList {
            if name == user.username {
                return user
            }
        }
        return nil
    }
    
    func add(_ username: String, _ password: String, _ picture: Data) -> User? {
        if !isDuplicate(username) {
            let newUser = User(context: self.managedObjectContext)
            newUser.username = username
            newUser.password = password
            newUser.picture = picture
            
            do {
                try managedObjectContext.save()
            } catch {}
            print(newUser)
            return newUser
        }
        else {
            print("That username is taken!")
            return nil
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
