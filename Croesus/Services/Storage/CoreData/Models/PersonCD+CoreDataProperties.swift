//
//  PersonCD+CoreDataProperties.swift
//  Croesus
//
//  Created by Ian Wanyoike on 03/02/2020.
//  Copyright © 2020 Pocket Pot. All rights reserved.
//
//

import Foundation
import CoreData

extension PersonCD {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PersonCD> {
        return NSFetchRequest<PersonCD>(entityName: "PersonCD")
    }

    @NSManaged public var avatar: Data?
    @NSManaged public var firstName: String?
    @NSManaged public var id: String
    @NSManaged public var idNumber: Int16
    @NSManaged public var lastName: String?

}
