// TYPE CASTING
// ########################################################
// Example #1 - Array w/ Misc Objects w/ Same SuperClass
class Animal {
    let name: String
    init(n: String) { name = n }
}
class Human: Animal {
    func code() { print("Clink, Clack, Click; goes the mechanical keyboard.") } }
class Fish: Animal {
    func swim() { print("Swish, swish.") }  }


// Create test objects from above classes
let mike = Human(n: "Mike")
let jack = Human(n: "Jack")
let nemo = Fish(n: "Nemo")


// Array of mixed types ~ Only allowed because they're all Animals
let neighbors = [mike, jack, nemo]


// Forced Downcast example, after we know the animal is a fish.  So it's safe to force the downcast.
func findNemo(from animals: [Animal]) {
    for animal in animals {
        if animal is Fish {
            print(animal.name)
            let fish = animal as! Fish // Forced Downcast
            fish.swim() }   }    }


// If neighbor[1] can be cast as a fish, then swim for your life.
if let fish = neighbors[1] as? Fish { fish.swim() }


// Any ~ Allows for any object to be in the array
let neighbors: [Any] = [mike, jack, nemo]

// New Lil' Birdie Structure
struct Bird { let name: String  }
let blueJ = Bird(name: "Bossy")
// AnyObject ~ FAILS: blueJ is a Struct, NOT a Class.
let neighbors: [AnyObject] = [mike, jack, nemo, blueJ]
// NSObject ~ FAILS: None of the elements inherit NSObjects
let neighbors: [NSObject] = [mike, jack, nemo, blueJ]
