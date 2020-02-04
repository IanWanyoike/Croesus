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
    let context: NSManagedObjectContext

    // MARK: - Initialization
    init(containerName: String = Constants.bundleName) {
        self.container = NSPersistentContainer(name: containerName)
        self.context = self.container.viewContext
    }

    // MARK: - Methods
    func load() -> Completable {
        Completable.create { completable in
            self.container.loadPersistentStores { _, error in
                guard error == nil else {
                    completable(.error(CoreDataError.loadStoresFailed(error?.localizedDescription)))
                    return
                }
                completable(.completed)
            }
            return Disposables.create()
        }
    }

    func saveContext() {
        guard self.context.hasChanges else { return }
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
