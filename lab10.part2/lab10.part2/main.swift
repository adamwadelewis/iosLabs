//
//  main.swift
//  lab10.part2
//
//  Created by Adam Lewis on 3/11/17.
//  Copyright © 2017 Adam Lewis. All rights reserved.
//

import Foundation

/**
 Dictionaries
 As mentioned, the *Dictionary* data type in Swift implements  associative arrays.   Data is stored in these structures as key-value tuples. The keys in a dictionary must be unique.  Note that  dictionaries in Swift are value types (as are Arrays).

 */

// declare immutable Dictionary with traditional generic type syntax and a Dictionary literal with one key-value pair
let countryCodes1: Dictionary<String, String> = ["Argentina" : "ar"]

// declare mutable Dictionary with shorthand type syntax
// and a Dictionary literal with multiple key-value pairs
var countryCodes2: [String : String] = ["Finland" : "fi",
                                        "South Africa" : "za", "Nepal" : "np"]

// declare mutable Dictionary with type inference and a Dictionary literal
var countryCodes3 = ["Argentina" : "ar"] // prefer this approach

// print with Dictionary description property (from Printable protocol) 

// Printable protocol's description property returns String
// invoke description property explicitly
print("PRINT DICTIONARIES USING THE DESCRIPTION PROPERTY EXPLICITLY")
print("countryCodes1: \(countryCodes1.description)")
print("countryCodes2: \(countryCodes2.description)")
print("countryCodes3: \(countryCodes3.description)")

print()

// invoke description property implicitly
print( "PRINT DICTIONARIES USING THE DESCRIPTION PROPERTY IMPLICITLY")
print("countryCodes1: \(countryCodes1)")
print("countryCodes2: \(countryCodes2)")
print("countryCodes3: \(countryCodes3)")

// declare a mutable empty Dictionary with initializer syntax
var countryCodes4 = [String : String]()

// declare a mutable empty Dictionary with an empty dictionary literal
var countryCodes5: [String : String] = [:]

// declare empty Dictionary with a minimiumCapacity
var countryCodes6 = [String : String] (minimumCapacity: 10) // no literal

// following is an invalid declaration because type inference fails
// var countryCodes7 = [:]  // cannot infer type of Dictionary

// print each of the empty Dictionary objects
print("PRINT EMPTY DICTIONARY OBJECTS")
print("countryCodes4 is \(countryCodes4)")
print("countryCodes5 is \(countryCodes5)")
print("countryCodes6 is \(countryCodes6)")

/**
 Iterating through a Dictionary
 One can use a for-loop to iterate through a dictionary.  Open a new
 project and enter the following code:
 */
let months = ["January" : 31, "February" : 29,
              "March" : 31, "April" : 30,  "May" : 31, "June" : 30,
              "July" : 31, "August" : 31, "September" : 30,
              "October" : 31, "November" : 30, "December" : 31]

// print table of month numbers and names
// use for...in to iterate through months Dictionary
print("ITERATING THROUGH A DAYS-PER-MONTH-IN-A-LEAP-YEAR DICTIONARY")
print("WITH FOR...IN DECOMPOSING KEY-VALUE PAIRS INTO THE TUPLE")
print("(monthName, monthDays), THEN PRINTING THE TUPLE ELEMENTS")
for (monthName, monthDays) in months {
    print("\(monthName):  \(monthDays)")
}

print()

// replace (key, value) form with tuple identifier like monthTuple,
// then say monthTuple.0 and monthTuple.1
print("ITERATING THROUGH A DAYS-PER-MONTH-IN-A-LEAP-YEAR DICTIONARY")
print("WITH FOR...IN USING A TUPLE NAME LIKE monthTuple")
print("THEN DECOMPOSING THE TUPLE WITH monthTuple.0 and monthTuple.1")
for monthTuple in months {
    print("\(monthTuple.0):  \(monthTuple.1)")
}



