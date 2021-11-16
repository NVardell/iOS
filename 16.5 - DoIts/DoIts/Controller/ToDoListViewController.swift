//
//  ViewController.swift
//  DoIts
//
//  Created by Nate Vardell on 11/14/21.
//

import UIKit

class ToDoListViewController: UITableViewController {

    var netflixBest = ["Stranger Things", "The Witcher", "Lost in Space"]
    
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        if let items = defaults.array(forKey: "ToDoListArray") as? [String] { netflixBest = items }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return netflixBest.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        cell.textLabel?.text = netflixBest[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected Row At = \(indexPath.row)")
        tableView.deselectRow(at: indexPath, animated: true)
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
    }
    
    
    // MARK: - Add New Items
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        let alert = UIAlertController(title: "Add new todo item", message: "", preferredStyle: .alert)
        
        // Create user interaction piece of the UIAlert being displayed to user
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            
            // What happens when the user clicks the Add Item button on our UIAlert.
            self.netflixBest.append(textField.text!)
            print("\nSuccessfully added item: \(String(describing: textField.text))")
            
            // Add updated list to User Defaults database to persist new ToDo list items
            self.defaults.set(self.netflixBest, forKey: "ToDoListArray")
            
            // Reload the TableView so the newly added item will appear in view
            self.tableView.reloadData()
        }
        
        // Add newly created UIAlertAction to our Alert we want to display
        alert.addAction(action)

        // Add descriptive message to UIAlert explaining reason for the alert
        alert.addTextField { alerTextField in
            alerTextField.placeholder = "Create new item"
            textField = alerTextField
            print("Finished Add Alert Text Closure")
        }
        
        // Display newly created alert
        present(alert, animated: true, completion: nil)
    }
}

