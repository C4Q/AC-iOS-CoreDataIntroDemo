//
//  CoreDataHelper.swift
//  NumberFacts
//
//  Created by C4Q  on 2/5/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit
import CoreData

class CoreDataHelper {
    private init() {}
    static let manager = CoreDataHelper()
    private let delegate = (UIApplication.shared.delegate as! AppDelegate)
    func save() {
        delegate.saveContext()
    }
    
    func getPosts(completionHandler: ([Post]) -> Void) {
        do {
            guard let posts = try moc().fetch(Post.fetchRequest()) as? [Post] else { return }
            completionHandler(posts)
        }
        catch {
            print(error)
        }
    }
    
    func getUsers(completionHandler: ([User]) -> Void) {
        do {
            guard let users = try moc().fetch(User.fetchRequest()) as? [User] else { return }
            completionHandler(users)
        }
        catch {
            print(error)
        }
    }
    func moc() -> NSManagedObjectContext {
        return delegate.persistentContainer.viewContext
    }
}
