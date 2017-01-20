//
//  AddTaskViewController.swift
//  Core Data Todo List
//
//  Created by ruby on 20/1/17.
//  Copyright © 2017 Zhexxian. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var isImpt: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func ButtonTapped(_ sender: Any) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let task = Task(context: context)
        
        task.name = textField.text!
        task.isImportant = isImpt.isOn
        //save the data to core data
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        //return to previous view
        
        navigationController!.popViewController(animated: true)
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
