//
//  Category.swift
//  DoIts
//
//  Created by Nate Vardell on 11/22/21.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name: String = ""
    let items = List<Item>()
}
