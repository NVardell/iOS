//
//  ToDoListViewController.swift
//  DoIts
//
//  Created by Nate Vardell on 11/14/21.
//

import UIKit
import CoreData

class ToDoListViewController: UITableViewController {

    var itemArray = [Item]()
    var selectedCat : Category? {
        didSet {
            loadItems()
        }
    }
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()
        print("\nData File Path = \(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))\n")
    }

    // MARK: - Add New Items
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {

        var textField = UITextField()
        let alert = UIAlertController(title: "Add new todo item", message: "", preferredStyle: .alert)

        // Create user interaction piece of the UIAlert being displayed to user
        let action = UIAlertAction(title: "Add Item", style: .default) { (_) in

            // What happens when the user clicks the Add Item button on our UIAlert.
            // self.itemArray.append(Item(t: textField.text!))

            let newItem = Item(context: self.context)
            newItem.title = textField.text!
            newItem.done = false
            newItem.parentCategory = self.selectedCat

            // Save updated list to persist newly added items
            self.saveItems()
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

    func saveItems() {
        // Persist list changes to Core Data's SQLite Database
        do { try context.save() } catch { print("Error saving Context. Error: \(error)") }

        // Reload view with updated items
        loadItems()
    }

    func loadItems(with req: NSFetchRequest<Item> = Item.fetchRequest(), predicate: NSPredicate? = nil) {
        
        // Create predicate requiring search results to have current category as parent
        let catPredicate = NSPredicate(format: "parentCategory.name MATCHES %@", selectedCat!.name!)
        if let searchPredicate = predicate { req.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [catPredicate, searchPredicate]) }
        else { req.predicate = catPredicate}
        
        // Attempt to fetch request for TableView Data
        do { itemArray = try context.fetch(req) } catch { print("Error fetching date.  Error: \(error)") }

        // Reload the TableView so updated items will appear
        tableView.reloadData()
    }

    // MARK: - TableView | DataSource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        itemArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        // Setup object being used in cell
        let item = itemArray[indexPath.row]

        // Setup row cell for display in TableView
        let cell = tableView.dequeueReusableCell(withIdentifier: K.Cells.toDoItems, for: indexPath)

        // Set cell attributes based on the attribute values of our item
        cell.textLabel?.text = item.title
        cell.accessoryType = item.done ? .checkmark : .none

        // Return cell for display in TableView
        return cell
    }

    // MARK: - TableView Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        // Row Index
        let x = indexPath.row

        // Switches the done state of an item for alternating checked/unchecked on UI
        itemArray[x].done = !itemArray[x].done

        // Save updated checkmarks
        saveItems()

        // Prevent row from staying selected/shaded
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - Search Bar Methods
extension ToDoListViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("Searching for: \(searchBar.text!)")
        let req: NSFetchRequest<Item> = Item.fetchRequest()
        req.sortDescriptors = [NSSortDescriptor(key: "title", ascending: true)]

        loadItems(with: req, predicate: NSPredicate(format: "title CONTAINS[cd] %@", searchBar.text!))
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
