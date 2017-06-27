//
//  SecondViewController.swift
//  Todo App
//
//  Created by David Henley on 6/27/17.
//  Copyright © 2017 Featured Drink. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var todoTextField: UITextField!

    @IBAction func addTodo(_ sender: Any) {
        let todo = todoTextField.text!
        let defaults = UserDefaults.standard
        
        // If empty don't do anything
        if todo.characters.count == 0 { return }
        
        // Check for existing todos in storage
        var todos = defaults.object(forKey: "todos") as? [String] ?? [String]()
        
        // Add todo to array
        todos.append(todo)
        
        // Overwrite the todos in storage
        defaults.set(todos, forKey: "todos")
        
        // Set the textfield back to blank
        todoTextField.text = ""
        
        // TODO: Remove on production
        print("Todos: \(todos)")
        
        // TODO: Navigate back to todo list
        // TODO: Save on return
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        addTodo(textField)
        return true
    }

}

