//
//  Data.swift
//  DoIts
//
//  Created by Nate Vardell on 11/20/21.
//

import Foundation
import RealmSwift

class Data: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var age: Int = 0
}
