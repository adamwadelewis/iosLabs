//
//  main.swift
//  lab09
//
//  Created by Adam Lewis on 3/11/17.
//  Copyright © 2017 Adam Lewis. All rights reserved.
//

import Foundation

/**
Swift provides three primary /collection types/:
 Arrays: Ordered collections of values
 Sets: Un-ordered collections of values
 Dictionaries: Un-ordered collections of key-value associations
 
There are /generic collections/: one must define a collectio in  terms of the type of object being stored in the collection.  This means that  arrays, sets, and dictionaries are always clear about the types of values and keys that store.
 
 The mutability of collections is controlled by whether they are defined as variables or constants.  Collections stored in variables re /mutable/: the contents can be changed after the collection is created.  Storing a collection in a constant implies that the collection is /immutable/ and its size and contents cannot be changed.
 
 Arrays store values of the same type in an ordered list. Let's examine how this data type operates in Swift.
 
 Let's start by looking at how we can declare and initialize arrays:
 */

let integers1 = [Int]()
print("integers1: \(integers1.description)")

let booleans = [Bool](repeating: true, count: 5)
print("booleans: \(booleans.description)")

let integers2: [Int] = [] // must specify Array's type
print("integers2: \(integers2.description)")

let integers3 = [0, 1, 2, 3, 4]
print("integers3: \(integers3.description)")

let strings =
    ["red", "orange", "yellow", "green", "blue", "indigo", "violet"]
print("strings: \(strings.description)")

let integers4 = integers3 + integers3
print("integers4: \(integers4.description)")

let integers5 = integers3 + [5, 6, 7, 8, 9]
print("integers5: \(integers5.description)")

/**
 Arrays can be initialized through a number of methods.  Note that, ust like strings, we can concatenate arrays together.
 */

let example = [2, 4, 6, 8, 10]
let boolValues = [Bool](repeating: true, count: 5)
let example2: [Int] = []
let example3 = [0,1,2,3,4,5]
let example4 = example3 + [6,7,8]

/**
 With v.3.0 of Swift, the language no longer supports the traditional C/C++ counted-FOR loop.  But there are a number of other variants of for-loops that make working with arrays so much easier:
 */

import Foundation // to access String formatting features


print(
    "Array integers via description property: \(example.description)")

// for...in loop automatically returning each Array element
print("\nArray integers via for...in loop: ")
for element in example {
    print("\(element)  ")
}



// for...in loop with range of indices
print("\nArray integers in column format via for...in loop with range")
print("Index  Value")
for index in 0..<example.count {
    print(String(format:"%5d%7d", index, example[index]))
}

// for...in loop with enumerate global function
print(
    "\nArray integers in column format via for...in loop with enumerate")
print("Index  Value")
for (index, element) in example.enumerated() {
    print(String(format:"%5d%7d", index, element))
}

/**
 Note the use of ranges in the different loops.  Ranges can be closed or half open... think of this as being the difference between using ">=" and ">" in a traditional for-loop.

 Swift gives us a rather strong protocol for manipulating the content of an array:
 */

// display contents, size and capacity of an Array<Int>
func displayIntegers(_ integers: [Int]) {
    print("contents: \(integers.description)")
    print("; size=\(integers.count); capacity=\(integers.capacity)")
}

var myArray = [Int]() // create an empty variable Array<Int>
print("After creating integers")
displayIntegers(myArray)

if myArray.isEmpty { // true if integers contains 0 elements
    print("integers is empty")
}

// append each value of i to integers
print("\nAppending values 1-5")
for i in 1...5 {
    myArray.append(i)
    displayIntegers(myArray)
}

// inserting elements
myArray.insert(0, at:0)
myArray.insert(6, at:myArray.count)
print("\nAfter inserting 0 at index 0 and 6 at integers.count")
displayIntegers(myArray)

// appending elements with +=
myArray += [7, 8, 9]
print("\nAfter appending 7, 8 and 9 with +=")
displayIntegers(myArray)

// removing element 0 and the last element
print("\n\(myArray.remove(at: 0)) was removed")
print("\(myArray.removeLast()) was removed")
print("After removing element 0 and the last element")
displayIntegers(myArray)

// removing all elements
myArray.removeAll() // by default, element storage is deallocated
print("\nAfter removing all remaining elements")
displayIntegers(myArray)

var anotherArray = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
print("anotherArray: \(anotherArray.description)")

// selecting the elements at indices 3...7 in anotherArray
var subset = anotherArray[3...7]
print("subset of anotherArray: \(subset.description)")

// replacing the elements at indices 5...9
anotherArray[5...9] = [50, 60, 70]
print("anotherArray after replacing elements: \(anotherArray.description)")

// removing the elements at indices 5...7
anotherArray[5...7] = []
print("anotherArray after removing elements 5-7: \(anotherArray.description)")

// removing the elements at indices 0..<2 (i.e., 0 and 1)
anotherArray[0..<2] = []
print("anotherArray after removing elements 0-1: \(anotherArray.description)")
    
    /**
     One of the objectives of Swift is to provide a much cleaner interface
     to some of the more advanced language features than what one must use
     when working with Objective-C or C++.  Consider the power one has when
     you can use closures.
     
     So, what's a closure. Those of you who have been through CS417 should
     be painfully aware of this concept.  The theory says that a closure is
     an anonymous function. Swift takes this further and treats functions
     as just being an example of a named closure.
     
     Both methods required an argument whose type is a closure with the
     signature *(ElementType, ElementType) -> Bool*.  So, in order to sort
     an array, one must pass the *sort* and *sorted* methods a closure that
     looks at the two elements and returns *true* if they are in order and
     *false* if they are not.  To get data in ascending order, then the
     closure should return *true* if the first element comes first in the
     sort order. For descending order, the closure should return *true* if
     the first element is greater than the second.
     */

// return true if s1 < s2
func ascendingOrder(_ s1: String, s2: String) -> Bool {
    return s1 < s2
}

// Array of color names to sort
let colors =
    ["red", "orange", "yellow", "green", "blue", "indigo", "violet"]

print("Array colors unsorted:\n\(colors.description)\n")

// sort ascending: function ascendingOrder
let sortedColors1 = colors.sorted();

print("Array sortedColors1:\n\(sortedColors1.description)\n")

// sort descending: fully typed closure expression
let sortedColors2 =
    colors.sorted {(s1: String, s2: String) -> Bool in return s1 > s2}
print("Array sortedColors2:\n\(sortedColors2.description)\n")

// sort ascending: inferred types
let sortedColors3 = colors.sorted {s1, s2 in return s1 < s2}
print("Array sortedColors3:\n\(sortedColors3.description)\n")

// sort descending: inferred types and implicit return
let sortedColors4 = colors.sorted {s1, s2 in s1 > s2}
print("Array sortedColors4:\n\(sortedColors4.description)\n")

// sort ascending: shorthand closure arguments
let sortedColors5 = colors.sorted{$0 < $1}
print("Array sortedColors5:\n\(sortedColors5.description)\n")


// reversing the elements of an Array
let reversed = colors.reversed()
print("Array reversed:\n\(reversed)")

/**
 BTW, the difference between *sort* and *sorted*?  The *sort* method
 modifies the array upon which it is called while *sorted* returns a
 new array with elements in the original array sorted.
 
 Swift is the first example of a /functional programming/ language that
 most of you have had the opportunity to use.  So, one has an ability
 to work on Swift arrays (and other data) using functions that operate
 in a similar fashion to the /algorithms/ components of the C++
 standard template library.  In particular, arrays support the
 *filter*, *map*, and *reduce* methods:
 */
// Array of Ints to filter, map and reduce
let values = [3, 10, 6, 1, 4, 8, 2, 5, 9, 7]

print("values: \(values.description)")

// filter: even values displayed in sorted order
let evenValues = values.filter({$0 % 2 == 0}).sorted()
print("Even values sorted: \(evenValues.description)")

// map: square each value then sort the squares
let squaresOfValues = values.map({$0 * $0}).sorted()
print("Squares of values sorted: \(squaresOfValues.description)")

// reduce: sum the elements of values
let sumOfValues = values.reduce(0, {$0 + $1})
print("Sum of values: \(sumOfValues)")

// filter, map and reduce: sum the squares of the even integers
/**
 Note here the use of shorthand argument names in the closures.
 Computing the sum of squares of the even integers in a list would be a
 multi-level deep set of nested loops in a procedural language.
 */
let sumOfSquares =
    values.filter({$0 % 2 == 0})
        .map({$0 * $0})
        .reduce(0, {$0 + $1})
print("Sum of the even value squares: \(sumOfSquares)")




