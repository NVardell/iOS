//
//  ViewController.swift
//  DoIts
//
//  Created by Nate Vardell on 11/14/21.
//

import UIKit

class ToDoListViewController: UITableViewController {

    // var netflixBest = ["Stranger Things", "The Witcher", "Lost in Space"]
    var netflixBest = [Item]()
    
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        
        netflixBest.append(Item(t: "Stranger Things"))
        netflixBest.append(Item(t: "The Witcher"))
        netflixBest.append(Item(t: "Lost in Space"))
        // if let items = defaults.array(forKey: "ToDoListArray") as? [String] { netflixBest = items }
    }

    
    
    // MARK: - TableView Datasource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return netflixBest.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Setup object being used in cell
        let item = netflixBest[indexPath.row]
        
        // Setup row cell for display in TableView
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        // Set cell attributes based on the attribute values of our item
        cell.textLabel?.text = netflixBest[indexPath.row].title
        cell.accessoryType = item.done ? .checkmark : .none
        
        // Return cell for display in TableView
        return cell
    }
    
    
    
    // MARK: - TableView Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected Row At = \(indexPath.row)")
        tableView.deselectRow(at: indexPath, animated: true)
        
        // Swithes the done state of an item for alternating checked/unchecked on UI
        netflixBest[indexPath.row].done = !netflixBest[indexPath.row].done
    }
    
    
    // MARK: - Add New Items
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        let alert = UIAlertController(title: "Add new todo item", message: "", preferredStyle: .alert)
        
        // Create user interaction piece of the UIAlert being displayed to user
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            
            // Setup new item to add to list
            // let newItem = Item(t: textField.text!)
            
            // What happens when the user clicks the Add Item button on our UIAlert.
            self.netflixBest.append(Item(t: textField.text!))
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

