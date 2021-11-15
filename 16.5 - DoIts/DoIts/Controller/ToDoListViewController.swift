//
//  ViewController.swift
//  DoIts
//
//  Created by Nate Vardell on 11/14/21.
//

import UIKit

class ToDoListViewController: UITableViewController {

    var netflixBest = ["Stranger Things", "The Witcher", "Lost in Space"]

    override func viewDidLoad() {
        super.viewDidLoad()
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
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            // What happens when the user clicks the Add Item button on our UIAlert.
            self.netflixBest.append(textField.text!)
            print("\nSuccessfully added item: \(String(describing: textField.text))")
            self.tableView.reloadData()
        }
        
        alert.addTextField { alerTextField in
            alerTextField.placeholder = "Create new item"
            textField = alerTextField
            print("Finished Add Alert Text Closure")
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}

