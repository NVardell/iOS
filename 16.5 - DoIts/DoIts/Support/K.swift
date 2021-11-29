//
//  K.swift
//  DoIts
//
//  Created by Nate Vardell on 11/19/21.
//

import Foundation

struct K {
    
    static let itemsSegue = "goToItems"
    
    struct Cells {
        static let category = "CategoryCell"
        static let toDoItems = "ToDoItemCell"
        static let swipeCell = "SwipeCell"
    }
    
    struct Relationship {
        static let category = "items"
        static let items = "parentCategory"
    }
    
    struct TableView {
        static let rowHeight = 85.0
    }
}
