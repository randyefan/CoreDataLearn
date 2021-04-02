//
//  Status+CoreDataProperties.swift
//  CoreDataLearn
//
//  Created by Randy Efan Jayaputra on 02/04/21.
//
//

import Foundation
import CoreData


extension Status {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Status> {
        return NSFetchRequest<Status>(entityName: "Status")
    }

    @NSManaged public var tanggal: Date?
    @NSManaged public var isCompleted: Bool
    @NSManaged public var challenge: Challenge?

}

extension Status : Identifiable {

}
