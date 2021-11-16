// ####################################
// Singleton Examples
// ####################################

// Examples of using common Singletons
let defaults = UserDefaults.standard
let sharedURLSession = URLSession.shared

// NOT a Singleton
class Car {
    var color = "Red"
}
let myCar = Car()
myCar.color = "Blue"

let yourCar = Car()
print(yourCar.color) // Output: Red



// Above as Singleton
class Car {
    var color = "Red"

    static let singletonCar = Car()
}
let myCar = Car.singletonCar
myCar.color = "Blue"
let yourCar = Car.singletonCar
print(yourCar.color) // Output: Blue



// More complex example of above Singleton Car
class A {
    init() {  Car.singletonCar.color = "Brown"  }
}
class B {
    init() {  print(Car.singletonCar.color)  }
}

let a = A()
let b = B()
