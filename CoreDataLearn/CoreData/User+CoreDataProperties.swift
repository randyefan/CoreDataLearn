//
//  User+CoreDataProperties.swift
//  CoreDataLearn
//
//  Created by Randy Efan Jayaputra on 02/04/21.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var name: String?
    @NSManaged public var points: Int64
    @NSManaged public var challenge: NSSet?

}

// MARK: Generated accessors for challenge
extension User {

    @objc(addChallengeObject:)
    @NSManaged public func addToChallenge(_ value: Challenge)

    @objc(removeChallengeObject:)
    @NSManaged public func removeFromChallenge(_ value: Challenge)

    @objc(addChallenge:)
    @NSManaged public func addToChallenge(_ values: NSSet)

    @objc(removeChallenge:)
    @NSManaged public func removeFromChallenge(_ values: NSSet)

}

extension User : Identifiable {

}
