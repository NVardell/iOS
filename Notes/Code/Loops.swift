// 
// FOR IN LOOPS
// ########################################################
// Example #1 - Loop Array
let names = [ "Nate", "Michael", "Aziz" ]
for name in names { print(name) }

// Example #2 - Loop Closed Range
for num in 1...5 { print(num) } // 12345

// Example #3 - Looping when you don't care what iteration it is
for _ in 1..5 { doStuff() }

// Example #4 - Loop Dictionary
let contacts = [ "Nate": 123456789, "Michael": 123456789, "Aziz": 123456789 ]
for person in contacts { print(person.value) }



// 
// WHILE LOOPS
// ########################################################
// Example #1 - Time Loop
import Foundation
var now = Date().timeIntervalSince970 // 00:00:00 UTC on Jan. 1, 1970.
let oneSecondFromNow = now+1
while now < oneSecondFromNow { 
    now = Date().timeIntervalSince970
    print("It must be true!") 
}