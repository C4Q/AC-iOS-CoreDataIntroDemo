//
//  User+Extension.swift
//  NumberFacts
//
//  Created by C4Q  on 2/5/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import Foundation

extension User {
    convenience init(name: String, dob: Date) {
        let moc = CoreDataHelper.manager.moc()
        self.init(context: moc)
        self.name = name
        self.dob = dob
        CoreDataHelper.manager.save()
    }
}
