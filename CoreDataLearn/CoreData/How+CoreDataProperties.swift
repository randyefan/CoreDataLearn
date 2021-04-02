//
//  How+CoreDataProperties.swift
//  CoreDataLearn
//
//  Created by Randy Efan Jayaputra on 02/04/21.
//
//

import Foundation
import CoreData


extension How {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<How> {
        return NSFetchRequest<How>(entityName: "How")
    }

    @NSManaged public var icon: Data?
    @NSManaged public var caption: String?
    @NSManaged public var challenge: How?

}

extension How : Identifiable {

}
