//
//  EntryViewController.swift
//  ToDoList
//
//  Created by Akshit Saxena on 3/6/24.
//

import UIKit

class EntryViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var field: UITextField!
    
    
    var update: (()->Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        field.delegate = self

        // Do any additional setup after loading the view.
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(saveTask))
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        saveTask()
        
        return true
    }
    
    
    //objc allows function to be used as selector
    @objc func saveTask(){
        
        guard let text = field.text, !text.isEmpty else{
            return
        }
        
        
        guard let count = UserDefaults().value(forKey: "count") as? Int else{
            return
        }
        
        let newCount = count + 1
        
        UserDefaults().set(newCount, forKey: "count")
        UserDefaults().set(text, forKey: "task_\(newCount)")
        
        
    }
    

}
