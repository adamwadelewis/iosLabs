//: CIS382 Lab 7 - Introduction to Swift

import Cocoa

//: Note the differences betweeen Swift and C++.  Semi-colons are optional and only required if multiple statements are placed on a single line.

print("Welcome to CIS382")

//: Now we try the following to see how we define and print a constant.  Note the the use of "string interpolation" within the string constant

let myText = "Oooo boy, Swift is fun"
print("He said: \(myText)")

//: And we can combine strings together using string concatenation

let myOtherText = "And we enjoy it so much"
print(myText + myOtherText)

//: Note the use of the let keyword. This defines a constant in Swift. Constants cannot be modified or changed after they are initialized. Variables are declared using the var keyword.

/**
 Swift uses "duck typing": if walks like a duck, quacks a duck,
 and smells like a duck, then it's pretty much a given that
it's a duck. The formal term is type inference. Variable
 types are determined from the variable's initializer. One may, if needed, define the type of a variable using a type annontation.
 */

var number1: Int = 42
var number2: Int = 31
//: 
/**
 Note the error that occurs when you try to define number3.
Swift is very picky about the differences in length in numeric
types.  Uncomment the line and see what happens.
*/
// var number3 = number1 + number2


/**
 Note some important differences between Swift and C++. The
braces delimiting blocks are always required even if the block
contains a single statement. Note also that Swift will no
allow you to use the "=" operator in an IF-statement.
*/

if number1 != number2 {
    print("\(number1) != \(number2)")
}






