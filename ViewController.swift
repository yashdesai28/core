//
//  ViewController.swift
//  coredatayash
//
//  Created by bmiit on 18/03/24.
//

import UIKit
import CoreData


class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    let tableView = UITableView()
    let agelable = UILabel();
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
        var context = NSManagedObjectContext()
    
    var student: [stud] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
            tableView.dataSource = self
        
        tableView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
        tableView.addSubview(agelable)
        
        context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Student", in: context)
               let newStudent = NSManagedObject(entity: entity!, insertInto: context)
               newStudent.setValue("ysdh", forKey: "sname")
               newStudent.setValue(21, forKey: "age")
               newStudent.setValue(2, forKey: "sid")
        
        do{
//                   try context.save()
                    print("save")
            fetchData();
               }catch{
                   print("no save")
               }
    }
    
    
    func fetchData(){
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Student")
        request.returnsObjectsAsFaults = false
        do{
            let result = try context.fetch(request)
            print(result[0])
            for data in result{
                
                var data = data as AnyObject
                var name = data.value(forKey: "sname")
                var sid = data.value(forKey: "sid")
                var age = data.value(forKey: "age")
                var obj = stud.init(sid: sid as! Int, sname: name as! String, age: age as! Int)
                student.append(obj)
                print(data)
               

            }
        }catch{
        }
        
        print(student)
    }
    
    
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return student.count
       }
       
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
         cell.textLabel!.text = "\(student[indexPath.row].sname)"
         
         
     
         return cell
       }
       
    

    


}

