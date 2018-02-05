//
//  Post.swift
//  NumberFacts
//
//  Created by C4Q  on 2/5/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import Foundation

extension Post {
    convenience init(title: String, number: Double, user: User) {
        let moc = CoreDataHelper.manager.moc()
        self.init(context: moc)
        self.title = title
        self.number = number
        self.user = user
        CoreDataHelper.manager.save()
    }
}
