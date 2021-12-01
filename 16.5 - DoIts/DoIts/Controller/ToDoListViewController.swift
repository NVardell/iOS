//
//  ToDoListViewController.swift
//  DoIts
//
//  Created by Nate Vardell on 11/14/21.
//

import UIKit
import RealmSwift
import RandomColor
import DynamicColor

class ToDoListViewController: SwipeTableViewController {

    let realm = try! Realm()
    var todoItems: Results<Item>?
    var selectedCat: Category? {
        didSet {
            loadItems()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        guard let navBar = navigationController?.navigationBar else { fatalError("Navigation Controller DNE") }
        
        if let hexColor = selectedCat?.backgroundHex {
            print("Setting NavBar Color")
            navBar.barTintColor = UIColor(hexString: hexColor).darkened()
            navBar.backgroundColor = UIColor(hexString: hexColor).darkened()
//            navBar.tintColor = UIColor(hexString: hexColor).darkened()  // Changes color of NavBar Text
        }
    }

    // MARK: - Add New Items
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {

        var textField = UITextField()
        let alert = UIAlertController(title: "Add new todo item", message: "", preferredStyle: .alert)

        // Create user interaction piece of the UIAlert being displayed to user
        let action = UIAlertAction(title: "Add Item", style: .default) { (_) in

            if let currentCat = self.selectedCat {
                // Save updated list to persist newly added items
                do {
                    try self.realm.write {
                        let newItem = Item()
                        newItem.title = textField.text!
                        newItem.dateCreated = Date()
                        newItem.backgroundHex = randomColor(hue: .blue, luminosity: .light).toHexString()
                        currentCat.items.append(newItem)
                    }
                } catch { print("Error saving Context. Error: \(error)") }
            }
            
            // Update TableView to display newest item
            self.tableView.reloadData()
        }

        // Add newly created UIAlertAction to our Alert we want to display
        alert.addAction(action)

        // Add descriptive message to UIAlert explaining reason for the alert
        alert.addTextField { alertTextField in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }

        // Display newly created alert
        present(alert, animated: true, completion: nil)
    }

    func loadItems() {
        todoItems = selectedCat?.items.sorted(byKeyPath: "dateCreated")
        tableView.reloadData()
    }
    override func updateModel(at indexPath: IndexPath) {
        if let itemForDeletion = self.todoItems?[indexPath.row] {
            do { try self.realm.write { self.realm.delete(itemForDeletion) }  }
            catch { print("Error deleting item.  Error: \(error)") }
        }
    }

    
    // MARK: - TableView | DataSource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        todoItems?.count ?? 1
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        // Get new cell from Super Class
        let cell = super.tableView(tableView, cellForRowAt: indexPath)

        // Setup cell attributes based on the attribute values of our item
        if let item = todoItems?[indexPath.row] {
            cell.textLabel?.text = item.title
            cell.textLabel?.textColor = DynamicColor(hexString: item.backgroundHex).lighter()
            cell.accessoryType = item.done ? .checkmark : .none
            cell.backgroundColor = UIColor(hexString: item.backgroundHex)
        } else {
            cell.textLabel?.text = "Empty List"
        }
        

        // Return cell for display in TableView
        return cell
    }

    
    
    // MARK: - TableView Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        // Switches the done state of an item for alternating checked/unchecked on UI
        if let item = todoItems?[indexPath.row] {
            do { try realm.write { item.done = !item.done } }
            catch { print("Error updating item status.  Error: \(error)") }
        }

        // Reload Table View to show updated Item
        tableView.reloadData()
        
        // Prevent row from staying selected/shaded
        tableView.deselectRow(at: indexPath, animated: true)
    }
}



// MARK: - Search Bar Methods
extension ToDoListViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("Searching for: \(searchBar.text!)")
        
        // Get search results
        todoItems = todoItems?.filter("title CONTAINS[cd] %@", searchBar.text!).sorted(byKeyPath: "title")
        
        // Refresh view
        tableView.reloadData()
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text?.count == 0 {
            loadItems()
            DispatchQueue.main.async {
                searchBar.resignFirstResponder()
            }
        }
    }
}
