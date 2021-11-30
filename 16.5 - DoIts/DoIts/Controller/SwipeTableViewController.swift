//
//  SwipeTableViewController.swift
//  DoIts
//
//  Created by Nate Vardell on 11/28/21.
//

import UIKit
import SwipeCellKit
import RandomColor

class SwipeTableViewController: UITableViewController, SwipeTableViewCellDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = K.TableView.rowHeight
    }

    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
        guard orientation == .right else { return nil }
        
        let deleteAction = SwipeAction(style: .destructive, title: "Delete") { _, indexPath in self.updateModel(at: indexPath)  }
        
        // Customize the action appearance
        deleteAction.image = UIImage(named: "delete-icon")
        
        return [deleteAction]
    }
    
    func tableView(_ tableView: UITableView, editActionsOptionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> SwipeOptions {
        var options = SwipeOptions()
        options.expansionStyle = .destructive
        return options
    }
    
    
    
    // MARK: - TableView Data Source Methods
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Setup reusable cell to display in Table View
        let cell = tableView.dequeueReusableCell(withIdentifier: K.Cells.swipeCell, for: indexPath) as! SwipeTableViewCell
        
        // Set Cell Delegate for new Swipe~able Cell
        cell.delegate = self
        
        // Return Row Cell to be displayed in TableView
        return cell
    }

    
    
    // MARK: - Stub Methods for SubClass Overrides
    func updateModel(at indexPath: IndexPath) {
        // Update our data model
    }
}

