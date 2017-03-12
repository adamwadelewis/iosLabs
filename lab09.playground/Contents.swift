//: Playground - noun: a place where people can play

import Cocoa

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
