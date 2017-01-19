//
//  ViewController.swift
//  TableDemo
//
//  Created by ruby on 19/1/17.
//  Copyright © 2017 Zhexxian. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView( _ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 12
    }
    
    func tableView( _ tableView: UITableView, cellForRowAt cellForRowAtIndexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "Thor"
        return cell
    }


}

