//
//  CategoryViewController.swift
//  DoIts
//
//  Created by Nate Vardell on 11/19/21.
//

import UIKit
import RealmSwift
import RandomColor

class CategoryViewController: SwipeTableViewController {

    let realm = try! Realm()
    var categories: Results<Category>?

    override func viewDidLoad() {
        super.viewDidLoad()
        loadCats()  // Load Categories
    }


    // MARK: - Data Manipulation Methods
    func saveCats(category: Category) {
        // Save Category changes
        do { try realm.write{ realm.add(category) } } catch { print("Error saving Category changes.  Error: \(error)") }
        loadCats()  // Reload view
    }
    func loadCats() {
        categories = realm.objects(Category.self)  // Fetch Categories List
        tableView.reloadData()  // Reload Table View
    }
    override func updateModel(at indexPath: IndexPath) {
        if let categoryForDeletion = self.categories?[indexPath.row] {
            do { try self.realm.write { self.realm.delete(categoryForDeletion) }  }
            catch { print("Error deleting category.  Error: \(error)") }
        }
    }


    // MARK: - Add New Categories
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var alertInputText = UITextField()
        let alert = UIAlertController(title: "Add New Category", message: "", preferredStyle: .alert)

        // Add action to Alert
        alert.addAction(UIAlertAction(title: "Add Category", style: .default) { (_) in
            // Setup new Category
            let newCategory = Category()
            newCategory.name = alertInputText.text!
            newCategory.backgroundHex = randomColor(hue: .blue, luminosity: .light).toHexString()
            // Save new Category
            self.saveCats(category: newCategory)
        })

        // Add text field to our Alert
        alert.addTextField { alertTextField  in
            alertTextField.placeholder = "Create new category"
            alertInputText = alertTextField
        }

        // Display Alert
        present(alert, animated: true)
    }


    // MARK: - TableView Data Source Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        categories?.count ?? 1  // If Categories is nil, return 1
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("Loading Cell for Row #\(indexPath.row)")
        
        // Get new cell from Super Class
        let cell = super.tableView(tableView, cellForRowAt: indexPath)
        
        
        if let cellBack = categories?[indexPath.row].backgroundHex {
            print("\n\nCell Background is = \(cellBack)\n\n")
//
//            if cellBack == "" {
//                categories![indexPath.row].backgroundHex = randomColor(hue: .blue, luminosity: .light).toHexString()
//            }
            // cell.backgroundColor = UIColor(hexString: cellBack)
        } else {
            // categories![indexPath.row].backgroundHex = randomColor(hue: .blue, luminosity: .light).toHexString()
            // cell.backgroundColor = UIColor(hexString: categories![indexPath.row].backgroundHex)
        }
        
        let bg = UIColor(hexString: categories?[indexPath.row].backgroundHex ?? "#89c6f4")
        cell.backgroundColor = bg
        // Setup cell attributes from current row category
        cell.textLabel?.text = categories?[indexPath.row].name ?? "No Categories Added"
        
        // Return Row Cell to be displayed in TableView
        return cell
    }
    
    // MARK: - TableView Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected Row #\(indexPath.row)")
        
        // Present List TableView with Category's ToDoList Items
        performSegue(withIdentifier: K.itemsSegue, sender: self)

        // Deselect the selected row
        tableView.deselectRow(at: indexPath, animated: true)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ToDoListViewController
        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.selectedCat = categories?[indexPath.row]
        }
    }
}



