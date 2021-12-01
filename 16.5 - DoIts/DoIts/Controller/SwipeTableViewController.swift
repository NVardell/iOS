//
//  SwipeTableViewController.swift
//  DoIts
//
//  Created by Nate Vardell on 11/28/21.
//

import UIKit
import SwipeCellKit
import RandomColor
import DynamicColor

class SwipeTableViewController: UITableViewController, SwipeTableViewCellDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = K.TableView.rowHeight
        tableView.separatorStyle = .none
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
    func updateModel(at indexPath: IndexPath) {  /**  Update our data model classes.  */  }
    func updateNavBarColor(backgroundColor: String) {
        guard let navBar = navigationController?.navigationBar else { fatalError("NavigationController does not exist") }
        
        let contrastOfBackgroundColor = DynamicColor(hexString: backgroundColor).desaturated()
        // Small title colors: (also shown when large title collapses by scrolling down)
        navBar.barTintColor = UIColor(hexString: backgroundColor)
        navBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: contrastOfBackgroundColor]
        
        // Large title colors:
        navBar.backgroundColor = UIColor(hexString: backgroundColor)
        navBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: contrastOfBackgroundColor]
        
        // Color the back button and icons: (both small and large title)
        navBar.tintColor = contrastOfBackgroundColor
    }
}

