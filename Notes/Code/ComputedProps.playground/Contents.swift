import Foundation

//func pizzaInchesToSlices(size pizza: Int) -> Int {
//    if pizza > 4 {  return pizza-4  }
//    else {  return pizza  }
//}
//
//let pizzaInches = 14
//let slices = pizzaInchesToSlices(size: pizzaInches)
//print(slices)
//
//
//var numberOfSlices: Int { return pizzaInches-4 }
//print(numberOfSlices)
//
/////
//// Can also be written with explicit get/set
/////
//var numberOfSlices2: Int {
//    get {return pizzaInches-4}
//    // NewValue magically exists and contains the new value of number of slices...
//    set {print("Number of slices has a new value which is \(newValue)")}
//}
//print(numberOfSlices2)
//
//
///**
//    EXAMPLE: Using calculated properties to find how many pizzas to purchase.
// */
//let pizzaInInches = 16
//var numPeople = 12
//let slicesPerFatty = 4
//
//var numSlicesPerPizza: Int {
//    if pizzaInInches > 4 {  return pizzaInInches-4  }
//    else {  return pizzaInInches  }
//}
//
//var numberOfPizzas: Int {
//    // Figure out how many pizzas to order
//    get {
//        let numFedPerPizza = (numSlicesPerPizza / slicesPerFatty)
//        return numPeople / numFedPerPizza
//    }
//    // Figure out how many peeps we can invite with what we have
//    set {
//        let totalSlices = numSlicesPerPizza * newValue
//        numPeople = totalSlices / slicesPerFatty
//    }
//}
//print(numberOfPizzas)
//numberOfPizzas = 4
//print(numPeople)
//
//
//
///**
//        EXAMPLE - Observed Properties
// */
//let largestPizza: Int = 18
//var pizzaInch = 10 {
//    didSet {
//        if pizzaInch > largestPizza {
//            print("Invalid pizza size; setting size our large @ 18 inches.")
//            pizzaInch=largestPizza
//        }
//    }
//}
//
//pizzaInch = 33
//print(pizzaInch)








/**
        CHALLENGE: Paint Calculator
 */
var width: Float = 1.5
var height: Float = 2.3
var area: Float = width * height
var bucketCoverage: Float = 1.5 // m^2

var bucketsOfPaint: Int {
    get {return Int(ceilf(area/bucketCoverage))}
    set {return area = Float(newValue) * bucketCoverage}
}
print(bucketsOfPaint)
print(area)
bucketsOfPaint = 8
print(area)
