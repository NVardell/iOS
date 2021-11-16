// ####################################
// User Default Examples
// ####################################


// Setup values we want to persist using User Defaults
let array = [1, 2, 3]
let dict = ["name": "Nate"]


// Retrieve User Defaults
let defaults = UserDefaults.standard


// Set User Preferences
defaults.set(0.24, forKey: "Volume")
defaults.set(true, forKey: "MusicOn")
defaults.set("Nate", forKey: "PlayerName")
defaults.set(Date(), forKey: "AppLastOpenedByUser")
defaults.set(array, forKey: "UserPreferencesArray")
defaults.set(dict, forKey: "MyDictionary")


// Retrieve values from User Defaults
let volume = defaults.float(forKey: "Volume")
let appLastOpen = defaults.object(forKey: "AppLastOpenedByUser")
let myArray = defaults.array(forKey: "UserPreferencesArray")            // UserDefaults array() returns an optional array.
let myArray = defaults.array(forKey: "UserPreferencesArray") as! [Int]  // If we want to be more explicit we can downcast the array into an array of integers.
let myDictionary = defaults.dictionary(forKey: "MyDictionary")
