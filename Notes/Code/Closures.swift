// Closure Notes

// Starting Point
func calc(n1: Int, n2: Int, operation: (Int, Int)->Int) -> Int { return operation(n1, n2) }
func add(n1:Int, n2:Int) -> Int { return n1 + n2 }
func multiply (n1:Int, n2:Int) -> Int { return n1 * n2 }
calc(n1:2, n2:3, operation: multiply)



// Migrate Multiply Function to Closure & Insert into Calc.
func calc(n1: Int, n2: Int, operation: (Int, Int)->Int) -> Int { return operation(n1, n2) }
func add(n1:Int, n2:Int) -> Int { return n1 + n2 }
calc(n1:2, n2:3, operation: { (n1:Int, n2:Int) -> Int in return n1 * n2 })



// Can reduce code even more because of Type Inference
func calc(n1: Int, n2: Int, operation: (Int, Int)->Int) -> Int { return operation(n1, n2) }
func add(n1:Int, n2:Int) -> Int { return n1 + n2 }
calc(n1:2, n2:3, operation: { (n1, n2) in return n1 * n2 })



// Can reduce code even more because of Anonymous Parameters
func calc(n1: Int, n2: Int, operation: (Int, Int)->Int) -> Int { return operation(n1, n2) }
func add(n1:Int, n2:Int) -> Int { return n1 + n2 }
calc(n1:2, n2:3, operation: { $0 * $1 })




// Can reduce code even more because of Trailing Closures
func calc(n1: Int, n2: Int, operation: (Int, Int)->Int) -> Int { return operation(n1, n2) }
func add(n1:Int, n2:Int) -> Int { return n1 + n2 }
calc(n1:2, n2:3) { $0 * $1 }





// Real Life Example(~ish)
// Pretend we want to add 1 to each element in an array.
let array = [6, 2, 3, 9, 4, 1]
func addOne(n1:Int) -> Int {
    return n1+1
}

array.map(addOne)


// Converting AddOne Function into a Closure to simplify code. (Can remove parenthesis because Closure is last input; aka trailing.)
array.map{ $0 + 1 }