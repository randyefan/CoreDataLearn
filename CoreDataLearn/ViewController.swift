//
//  ViewController.swift
//  CoreDataLearn
//
//  Created by Randy Efan Jayaputra on 02/04/21.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    var people: [User] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Untuk Cek Lokasi File .sql tracking with liya app
        let dirPaths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let docsDir = dirPaths[0]
        print(docsDir)
    }

    @IBAction func onePressed(_ sender: Any) {
        saveUser(name: "OkiDoki", extraPoint: 85000)
    }
    
    @IBAction func twoPressed(_ sender: Any) {
        let user = CoreDataManager.shared.fetchAllUsers()
        if let user = user {
            people = user
        }
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
        updateOneUser(user: people[1])
    }
    
    @IBAction func fivePressed(_ sender: Any) {
        if people.count == 0 {
            print("Klik fetch dulu")
        }
        deleteUser(user: people[0])
    }
    
    func saveUser(name: String, extraPoint: Int) {
        let user = CoreDataManager.shared.saveUser(name: name, extraPoint: extraPoint)
        if user != nil {
            people.append(user!)
        }
    }
    
    func updateOneUser(user: User) {
        CoreDataManager.shared.updateOneUsers(user: user)
    }
    
    func deleteUser(user: User) {
        CoreDataManager.shared.deleteUser(user: user)
    }
}

