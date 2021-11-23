//
//  ToDoListViewController.swift
//  DoIts
//
//  Created by Nate Vardell on 11/14/21.
//

import UIKit
import RealmSwift

class ToDoListViewController: UITableViewController {

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

    
    // MARK: - TableView | DataSource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("\n\nLoading Items for Category: \(todoItems?.count ?? 1)\n\n")
        return todoItems?.count ?? 1
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        // Setup row cell for display in TableView
        let cell = tableView.dequeueReusableCell(withIdentifier: K.Cells.toDoItems, for: indexPath)

        // Setup cell attributes based on the attribute values of our item
        if let item = todoItems?[indexPath.row] {
            cell.textLabel?.text = item.title
            cell.accessoryType = item.done ? .checkmark : .none
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
