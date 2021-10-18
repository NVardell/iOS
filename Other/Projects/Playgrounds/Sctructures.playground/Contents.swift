import UIKit

struct Town {
    let name = "Wonderland"
    var citizens = ["Angela", "Jack Bauer"]
    var resources = ["Grain":100, "Ore":42, "Wool":75]
    func fortify() {
        print("Defenses increased!")
    }
}

// Create a town object
var myTown = Town()

print(myTown.citizens) // ["Angela", "Jack Bauer"]
print("\(myTown.name) has \(myTown.resources["Grain"]!) bags of grain.") // Wonderland has 100 bags of grain.

// Add a Citizen
myTown.citizens.append("Keanu Reeves")
print(myTown.citizens) // ["Angela", "Jack Bauer", "Keanu Reeves"]






// #######################################################################
// #######################################################################
// #######################################################################
// Town V2
struct Town_v2 {
    let name: String
    var citizens: [String]
    var resources: [String:Int]
    func fortify() {
        print("Defenses increased!")
    }
    init(name:String, citizens:[String], resources:[String:Int]) {
        self.name = name
        self.citizens = citizens
        self.resources = resources
    }
}

var anotherTown = Town_v2(name: "Town2", citizens: ["Tom Hanks"], resources: ["Coconuts":100])
anotherTown.citizens.append("Wilson")
print(anotherTown.citizens)

var ghostTown = Town_v2(name: "Ghostland", citizens: [], resources: ["Tumbleweed":1])
