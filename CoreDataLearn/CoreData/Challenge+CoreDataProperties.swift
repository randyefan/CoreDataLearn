//
//  Challenge+CoreDataProperties.swift
//  CoreDataLearn
//
//  Created by Randy Efan Jayaputra on 02/04/21.
//
//

import Foundation
import CoreData


extension Challenge {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Challenge> {
        return NSFetchRequest<Challenge>(entityName: "Challenge")
    }

    @NSManaged public var challengeId: String?
    @NSManaged public var desc: String?
    @NSManaged public var status: NSSet?
    @NSManaged public var how: NSSet?
    @NSManaged public var user: User?

}

// MARK: Generated accessors for status
extension Challenge {

    @objc(addStatusObject:)
    @NSManaged public func addToStatus(_ value: Status)

    @objc(removeStatusObject:)
    @NSManaged public func removeFromStatus(_ value: Status)

    @objc(addStatus:)
    @NSManaged public func addToStatus(_ values: NSSet)

    @objc(removeStatus:)
    @NSManaged public func removeFromStatus(_ values: NSSet)

}

// MARK: Generated accessors for how
extension Challenge {

    @objc(addHowObject:)
    @NSManaged public func addToHow(_ value: How)

    @objc(removeHowObject:)
    @NSManaged public func removeFromHow(_ value: How)

    @objc(addHow:)
    @NSManaged public func addToHow(_ values: NSSet)

    @objc(removeHow:)
    @NSManaged public func removeFromHow(_ values: NSSet)

}

extension Challenge : Identifiable {

}
