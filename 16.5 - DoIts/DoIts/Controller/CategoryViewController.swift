//
//  CategoryViewController.swift
//  DoIts
//
//  Created by Nate Vardell on 11/19/21.
//

import UIKit
import CoreData

class CategoryViewController: UITableViewController {

    private var categories = [Category]()
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()
        // Load Categories
        loadCats()
    }


    // MARK: - TableView Data Source Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        categories.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Setup Category Object being displayed in Table View row
        let category: Category = categories[indexPath.row]

        // Setup reusable cell to display in Table View
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: K.Cells.category, for: indexPath)

        // Setup cell attributes from current row category
        cell.textLabel?.text = category.name

        // Return Row Cell to be displayed in TableView
        return cell
    }


    // MARK: - Data Manipulation Methods
    func saveCats() {
        // Save Category changes
        do { try context.save() } catch { print("Error saving Category changes.  Error: \(error)") }
        // Reload view
        loadCats()
    }
    func loadCats(with req: NSFetchRequest<Category> = Category.fetchRequest()) {
        // Fetch Categories List
        do { categories = try context.fetch(req) } catch { print("Error fetching Categories.  Error: \(error)") }
        // Reload view
        tableView.reloadData()
    }


    // MARK: - Add New Categories
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var alertInputText = UITextField()
        let alert = UIAlertController(title: "Add New Category", message: "", preferredStyle: .alert)

        // Add action to Alert
        alert.addAction(UIAlertAction(title: "Add Category", style: .default) { (_) in
            // Create new Category w/ empty list of ToDo Items
            let newCategory = Category(context: self.context)
            newCategory.name = alertInputText.text!
            newCategory.items = []
            // Save new Category
            self.saveCats()
        })

        // Add text field to our Alert
        alert.addTextField { alertTextField  in
            alertTextField.placeholder = "Create new category"
            alertInputText = alertTextField
        }

        // Display Alert
        present(alert, animated: true)
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
            destinationVC.selectedCat = categories[indexPath.row]
        }
    }
}
