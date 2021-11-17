//
//  ViewController.swift
//  DoIts
//
//  Created by Nate Vardell on 11/14/21.
//

import UIKit
import CoreData

class ToDoListViewController: UITableViewController {

    var netflixBest = [Item]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Data File Path = \(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))")
        
        loadItems()
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
        
        // Swithes the done state of an item for alternating checked/unchecked on UI
        netflixBest[indexPath.row].done = !netflixBest[indexPath.row].done
        
        // Save updated checkmarks
        saveItems()
        
        // Prevent row from staying selected/shaded
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    
    // MARK: - Add New Items
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        let alert = UIAlertController(title: "Add new todo item", message: "", preferredStyle: .alert)
        
        // Create user interaction piece of the UIAlert being displayed to user
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            
            // What happens when the user clicks the Add Item button on our UIAlert.
            self.netflixBest.append(Item(t: textField.text!))
            
            // Save updated list to persist newly added items
            self.saveItems()
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
    
    
    func saveItems() {
        do {
            let data = try PropertyListEncoder().encode(self.netflixBest)
            try data.write(to: self.dataFilePath!)
            
            // Reload the TableView so the updated item will appear in TableView
            tableView.reloadData()
        } catch {
            print("Error encoding array. Error: \(error)")
        }
    }
    
    func loadItems() {
        if let data = try? Data(contentsOf: dataFilePath!) {
            do {
                netflixBest = try PropertyListDecoder().decode([Item].self, from: data)
            } catch {
                print("Error decoding item array. Error: \(error)")
            }
        }
    }
}

