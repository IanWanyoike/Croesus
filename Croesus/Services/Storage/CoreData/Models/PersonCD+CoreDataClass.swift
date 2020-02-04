//
//  PersonCD+CoreDataClass.swift
//  Croesus
//
//  Created by Ian Wanyoike on 03/02/2020.
//  Copyright © 2020 Pocket Pot. All rights reserved.
//
//

import Foundation
import CoreData

@objc(PersonCD)
public class PersonCD: NSManagedObject, PersonType {

    static func build(from person: PersonType, with context: NSManagedObjectContext) -> PersonCD {
        let personCD = PersonCD(context: context)
        personCD.store(from: person)
        return personCD
    }

    func store(from person: PersonType) {
        self.id = person.id
        self.idNumber = person.idNumber
        self.firstName = person.firstName
        self.lastName = person.lastName
        self.avatar = person.avatar
    }
}
