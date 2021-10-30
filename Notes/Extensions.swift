import UIKit



// EXAMPLE #1
//      Rounding Doubles
let myDouble = 3.14159

// String formatting every Double to be a single decimal place is a hassle
let roundDouble = String(format:"%.1f", myDouble)
print(roundDouble)      // 3.1

// Sadly, the Double DataType's round() method only returns whole numbers.
let roundedDouble = myDouble.round()
print(roundedDouble)    // 3

// If only the Double DataType could be extended to have a customizable round() method. 🤔
// Something like.... 
//    myDouble.round(to: x)
extension Double {
    func round(to places: Int) {
        let precision = pow(10, Double(places)) // 10^x -> 10, 100, etc.
        let n = self    // Setting equal to places
        
        // Now do math to get double rounded to 'x' decimal places
        // Example         // myDouble.round(to: 1)
        n = n * precision  // n = 3.14159 * 10
        n.round()          // 31
        n = n / precision  // n = 31 / 10
        return n           // 3.1
    }
}
// Now we can use our magical Double extension created above
print(myDouble.round(to: 1)) // 3.1




// EXAMPLE #2
//      Programmatically creating a button & making it circular.
//      But... who wants to type all that every time we want circle buttons?! 🤯
let button = UIButton(frame: CGRect(x:0, y:0, width:50, height:50))
button.backgroundColor = .red
button.clipsToBounds = true
button.layer.cornerRadius = 25 // Pixels
//      Sooo... We extend UI button to expedite making circle buttons
extension UIButton {
    func makeCircular() {
        self.clipsToBounds = true
        self.layer.cornerRadius = self.frame.size.width / 2
    }
}
let extendedButton = UIButton(frame: CGRect(x:0, y:0, width:50, height:50))
extendedButton.makeCircular() // Now we magically have a circular button.




// EXAMPLE #3
//      Extending our Flying Example from our Protocol Notes
protocol CanFly {
    func fly()
}
extension CanFly {
    func fly() {
        print("Default flying method so it is no longer required for every adoption to explicitly define.")
    }
}
struct Helicopter: CanFly {}
let heli = Helicopter()
heli.fly() // Default flying method so it is no longer required for every adoption to explicitly define.