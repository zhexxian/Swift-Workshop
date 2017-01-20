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
        cell.textLabel?.text = tasks[indexPath.row].name
        return cell
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

