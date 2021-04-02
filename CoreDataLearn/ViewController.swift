//
//  ViewController.swift
//  CoreDataLearn
//
//  Created by Randy Efan Jayaputra on 02/04/21.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    var people: [NSManagedObject] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Untuk Cek Lokasi File .sql tracking with liya app
        let dirPaths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)

        let docsDir = dirPaths[0]

        print(docsDir)
    }

    @IBAction func onePressed(_ sender: Any) {
        saveUser(name: "Bambang", extraPoint: 20)
    }
    
    @IBAction func twoPressed(_ sender: Any) {
        fetchAllUsers()
    }
    
    @IBAction func threePressed(_ sender: Any) {
        for i in 0..<people.count {
            print(people[i].value(forKey: "name")!)
            print(people[i].value(forKey: "points")!)
        }
    }
    
    @IBAction func fourPressed(_ sender: Any) {
        if people.count == 0 {
            print("Klik fetch dulu")
        }
        updateOneUsers(user: people[1] as! User)
    }
    
    @IBAction func fivePressed(_ sender: Any) {
        if people.count == 0 {
            print("Klik fetch dulu")
        }
        deleteUser(user: people[0] as! User)
    }
    
    func saveUser(name: String, extraPoint: Int) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        guard let userEntity = NSEntityDescription.entity(forEntityName: "User", in: managedContext), let challengeEntity = NSEntityDescription.entity(forEntityName: "Challenge", in: managedContext)  else {
            return
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
        } catch {
            fatalError()
        }
    }
    
    func fetchAllUsers() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "User")
        
        do {
            people = try managedContext.fetch(fetchRequest)
        } catch let error {
            print("could not fetch \(error.localizedDescription)")
        }
    }
    
    func updateOneUsers(user: User) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
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
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
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

