//
//  main.swift
//  lab10.part03
//
//  Created by Adam Lewis on 3/11/17.
//  Copyright © 2017 Adam Lewis. All rights reserved.
//

import Foundation

/**
 A few notes about dictionaries
 There are a few things you should note about *Dictionary* objects in Swift:
 - Don't forget that these are value types... so one will want to use  "==" and "!=" to check to see two Dictionary objects contain the  same contents.  The "===" and "!==" are for /reference/ types; i.e., classes!
 - The Dictionary object provides *count* and *isEmpty* properties to  get useful information about a Dictionary.
 - Note that you can use just anything as value types in an
 Dictionary.  For instance, you can store Arrays as values and then use things like *filter* and *reduce* to do things to those values
 - The *keys* property gives you back an iterable collection of the keys in a  dictionary (but you can't depend upon the order).  You can then  iterate through those keys to get at values in the dictionary. The  *values* property does the same thing for the values in a  dictionary.
 
 One can access values of a Dictionary using a subscript notation.
 */

// mutable Dictionary maps Roman numerals to their decimal equivalents
var romanNumerals = ["I" : 1, "II" : 2, "III" : 3,
                     "V" : 5, "X" : 100] // 100 should be 10 -- we'll soon correct this..

// print table of Roman numerals and decimal values
print("\nDECIMAL EQUIVALENTS OF ROMAN NUMERALS")
print(romanNumerals)

// fix decimal equivalent on Roman numeral "X"
romanNumerals["X"] = 10
print("\nAFTER CORRECTING VALUE OF KEY \"X\"")
print(romanNumerals)

// use subscripting to add a new key-value pair
romanNumerals["L"] = 50
print("\nADDED NEW KEY-VALUE PAIR [\"L\" : 50]")
print(romanNumerals)

// use subscripting to assign nil to a key to remove its key-value pair
romanNumerals["III"] = nil
print("\nAFTER ASSIGNING NIL TO \"III\" TO REMOVE ITS KEY-VALUE PAIR")
print(romanNumerals)

// prints Optional(5)
// print "without forced unwrapping" and "with forced unwrapping"
print()
print("WITHOUT FORCED UNWRAPPING: ")
print(romanNumerals["V"] as Any) // Optional because key may not exist?
print("   WITH FORCED UNWRAPPING: ")
print(romanNumerals["V"]!) // Optional because key may not exist?

// result of access attempt with subscripting could be nil if no item
let romanSymbol = "III"
if let decimalNumber = romanNumerals[romanSymbol] {
    print("\nDECIMAL: \(decimalNumber)")
} else {
    print("\nromanNumerals DOES NOT CONTAIN: \(romanSymbol)")
}

// use subscripting to add a new key-value pair to an empty Dictionary
var romanNumerals1: [String : Int] = [:] // new empty Dictionary
romanNumerals1["C"] = 100 // insert key-value pair into empty Dictionary
print("\nAFTER ADDING THE KEY-VALUE PAIR [\"C\" : 100] TO")
print("THE EMPTY romanNumerals1 DICTIONARY")
print("romanNumerals1 IS: \(romanNumerals1)")

/**
 Working with Key-Value pairs
 It is also possible to manipulate a Dictionary using the direct  protocol provided by the class.
 */

// Start with empty Dictionary
var countryCodes : [String : String] = [:]

// method updateValue
// add a new key-value pair with method updateValue
// handle optional return of previous value (of type String?)
if let previous = countryCodes.updateValue("za", forKey: "South Africa") {
    print("PREVIOUS VALUE FOR KEY \"South Africa\" WAS \(previous)")
} else {
    print("KEY \"South Africa\" IS NEW")
}

print("countryCodes: \(countryCodes)\n")

// add a second key-value pair
// "ar" is incorrect for "Australia" should be "au" -- we'll fix below
// handle optional return of previous value (of type String?)
if let previous = countryCodes.updateValue("ar", forKey: "Australia") {
    print("PREVIOUS VALUE FOR KEY \"Australia\" WAS \(previous)")
} else {
    print("KEY \"Australia\" IS NEW")
}

print("countryCodes: \(countryCodes)\n")

// update existing value (correct Australia's code from "ar" to "au"
// handle optional return of previous value (of type String?)
print("CORRECTED \"Australia\" COUNTRY CODE FROM \"ar\" TO \"au\"")
if let previous = countryCodes.updateValue("au", forKey: "Australia") {
    print("PREVIOUS VALUE FOR KEY \"Australia\" WAS \"\(previous)\"")
} else {
    print("KEY \"Australia\" IS NEW")
}

print("countryCodes: \(countryCodes)\n")

// method removeValueForKey
// remove existing key-value pair
// handle optional return (of type String?)
if let previous = countryCodes.removeValue(forKey: "South Africa") {
    print("KEY-VALUE PAIR \"South Africa\": ")
    print("\"\(previous)\" WAS REMOVED")
} else {
    print("KEY \"South Africa\" WAS NOT IN DICTIONARY")
}

print("countryCodes: \(countryCodes)\n")

// attempt to remove non-existing value
// handle nil return
if let previous = countryCodes.removeValue(forKey: "Paraguay") {
    print("KEY-VALUE PAIR \"Paraguay\": \"\(previous)\" WAS REMOVED")
} else {
    print("KEY \"Paraguay\" IS NOT IN DICTIONARY")
}

print("countryCodes: \(countryCodes)\n")

// method removaAll
countryCodes.removeAll(keepingCapacity: true)
if countryCodes.isEmpty {
    print("DICTIONARY countryCodes IS EMPTY")
}

print("countryCodes: \(countryCodes)\n")


