//
//  ViewController.swift
//  Core Data Todo List
//
//  Created by ruby on 20/1/17.
//  Copyright © 2017 Zhexxian. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var tasks:[Task] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.delegate = self
        tableView.dataSource = self

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getData()
        
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView( _ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView( _ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        
        if task.isImportant {
            //press Ctrl + Cmd + Spacebar for emoji
            cell.textLabel?.text = "😎 \(task.name!)"
            //http://uicolor.xyz/#/hex-to-ui
            cell.backgroundColor = UIColor(red:0.97, green:0.58, blue:0.69, alpha:1.0)
        
        }
        else {
        
            cell.textLabel?.text = "😏 \(task.name!)"
            cell.backgroundColor = UIColor.gray
        
        }
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        if editingStyle == .delete {
        
            let task = tasks[indexPath.row]
            context.delete(task)
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
            do {
                tasks = try context.fetch((Task.fetchRequest()))
            }
            catch {
                print ("Fetching failed")
            }
        
        }
        
        tableView.reloadData()
        
    }
    
    func getData() {
    
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
            tasks = try context.fetch(Task.fetchRequest())
        }
        catch {
            print("Fetching failed")
        }
        
    }



}

