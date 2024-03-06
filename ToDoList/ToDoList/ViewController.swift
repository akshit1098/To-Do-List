//
//  ViewController.swift
//  ToDoList
//
//  Created by Akshit Saxena on 3/6/24.
//

import UIKit

class ViewController: UIViewController {
    
    

    @IBOutlet weak var tableView: UITableView!
    
    
    
    @IBAction func didTapAdd(_ sender: UIBarButtonItem) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "entry") as! EntryViewController
        vc.title = "New Task"
        vc.update = {
            self.updateTasks()
            
        }
        navigationController?.pushViewController(vc, animated: true)
        
        
    }
    
    
    func updateTasks(){
        
    }
    
    var tasks = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Tasks"
        tableView.delegate = self
        tableView.dataSource = self
        
        //Setup
        if !UserDefaults().bool(forKey: "setup"){
            UserDefaults().set(true, forKey: "setuo")
            //set 0 for the tasks count for tasks we have initialliy
            UserDefaults().set(0, forKey: "count")
        }
        
        //Get all current saved tasks
        updateTasks()
    }

    

}

extension ViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = tasks[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
}
