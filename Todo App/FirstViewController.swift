//
//  FirstViewController.swift
//  Todo App
//
//  Created by David Henley on 6/27/17.
//  Copyright © 2017 Featured Drink. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var table: UITableView!
    var todos = [String]()
    let defaults = UserDefaults.standard
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = todos[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        // If swipe left on item
        if editingStyle == UITableViewCellEditingStyle.delete {
            // Remove this item from array
            todos.remove(at: indexPath.row)
            
            // Reload table data
            table.reloadData()
            
            // Save the todos back to storage
            defaults.set(todos, forKey: "todos")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        todos = defaults.object(forKey: "todos") as? [String] ?? [String]()
        
        table.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

