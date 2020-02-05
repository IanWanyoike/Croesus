//
//  CoreDataPersistor.swift
//  Croesus
//
//  Created by Ian Wanyoike on 01/02/2020.
//  Copyright © 2020 Pocket Pot. All rights reserved.
//

import CoreData
import RxSwift
import os.log

enum CoreDataError: Error {
    case loadStoresFailed(String?)
}

class CoreDataService {

    // MARK: - State
    let container: NSPersistentContainer
    var context: NSManagedObjectContext { self.container.viewContext }

    // MARK: - Initialization
    init(containerName: String = Constants.bundleName) {
        self.container = NSPersistentContainer(name: containerName)
        self.container.loadPersistentStores { _, error in
            guard let error = error else { return }
            os_log("Load Persistent Stores Failed: %@", error.localizedDescription)
        }
    }

    func saveContext() {
        guard self.context.hasChanges else {
            os_log("Core Data Context Is Nil")
            return
        }
        self.context.perform {
            do {
                try self.context.save()
            } catch {
                os_log("Core Data Save Context Error: %a", error.localizedDescription)
            }
        }
    }
}

class CoreDataPersistor {

    let service: CoreDataService

    init(service: CoreDataService) {
        self.service = service
    }
}

public extension CodingUserInfoKey {
    // Helper property to retrieve the context
    static let managedObjectContext = CodingUserInfoKey(rawValue: "managedObjectContext")
}
