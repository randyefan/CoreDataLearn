//
//  CoreDataManager.swift
//  CoreDataLearn
//
//  Created by Randy Efan Jayaputra on 02/04/21.
//

import UIKit
import CoreData

struct CoreDataManager {
    static var shared = CoreDataManager()
    private init() {}
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "CoreDataLearn")
        
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()
    
    func saveContext() {
        let context = CoreDataManager.shared.persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let error = error as NSError
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
    }
    
    func saveUser(name: String, extraPoint: Int) -> User? {
        let managedContext = CoreDataManager.shared.persistentContainer.viewContext
        guard let userEntity = NSEntityDescription.entity(forEntityName: "User", in: managedContext), let challengeEntity = NSEntityDescription.entity(forEntityName: "Challenge", in: managedContext)  else {
            return nil
        }
        
        let user = NSManagedObject(entity: userEntity, insertInto: managedContext)
        let challenge = NSManagedObject(entity: challengeEntity, insertInto: managedContext)
        
        user.setValue(name, forKey: "name")
        user.setValue(extraPoint, forKey: "points")
        challenge.setValue("1", forKey: "challengeId")
        challenge.setValue("yuk bisa yuk", forKey: "desc")
        challenge.setValue(user, forKey: "user")
        
        do {
            try managedContext.save()
            return user as? User
        } catch {
            fatalError()
        }
    }
    
    func fetchAllUsers() -> [User]? {
        let managedContext = CoreDataManager.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "User")

        do {
            let people = try managedContext.fetch(fetchRequest)
            return people as? [User]
//            people = try managedContext.fetch(fetchRequest)
        } catch let error {
            print("could not fetch \(error.localizedDescription)")
            return nil
        }
    }
    
    func updateOneUsers(user: User) {
        let managedContext = CoreDataManager.shared.persistentContainer.viewContext
        do {
            user.setValue("Jono", forKey: "name")
            user.setValue(100, forKey: "points")
            
            do {
                try managedContext.save()
            } catch let error {
                print(error.localizedDescription)
            }
        }
    }
    
    func deleteUser(user: User) {
        let managedContext = CoreDataManager.shared.persistentContainer.viewContext
        
        do {
            managedContext.delete(user)
        }
        
        do {
            try managedContext.save()
        } catch {
            print("error to delete")
        }
    }
}

