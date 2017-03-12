//
//  main.swift
//  lab10.part01
//
//  Created by Adam Lewis on 3/11/17.
//  Copyright © 2017 Adam Lewis. All rights reserved.
//

import Foundation

/**
 A dictionary stores associations between keys of the same type and  values of the same type in a collection with no defined ordering. Each value is associated with a unique key that acts as an identifier for that value within the dictionary.
 
 We begin with looking at the enumeration and tuple data types in  Swift.  Create a new Swift macOS Console Application  in Xcode and enter the following code.
 
 We begin by importing the Darwin framework.  This gets us access to operating system services and, in particular, to functions for generating pseudo-random numbers.
 
 Then we define two enumerations: *Status* and *DiceNames*. Note the differences between *enums* in Swift and C++.
 */

import Darwin

// enum representing game status constants (no raw type)
enum Status {
    case Continue, Won, Lost
}

// enum with Int constants representing common dice totals
enum DiceNames: Int {
    case SnakeEyes = 2
    case Trey = 3
    case Seven = 7
    case YoLeven = 11
    case BoxCars = 12
}

/**
 Now add the following code to your file.
 */

// function that rolls two dice and returns them and their sum as a tuple
func rollDice() -> (die1: Int, die2: Int, sum: Int) {
    let die1 = Int(1 + arc4random_uniform(6)) // first die roll
    let die2 = Int(1 + arc4random_uniform(6)) // second die roll
    return (die1, die2, die1 + die2)
}

// function to display a roll of the dice
func displayRoll(roll: (Int, Int, Int)) {
    print("Player rolled \(roll.0) + \(roll.1) = \(roll.2)")
}

/**
 The calls to *arc4random_uniform()* generate a uniformly distributed random number between 0 and 5.  Take note of the cast of the return value of the die throws to integer.   Swift does *NOT* do implicit type coercion and so the software developer must be explicit and cast values when required.
 
 Note that  we define the return type as a /tuple/.  This allows us to associate related quantities and make it appear that we're returning multiple values from a function. Note it is possible to decompose a tuple.  For example:
 */
var (die1, die2, sum) = rollDice();
(_, _, sum) = rollDice()

/**
 Take note of the parameter of the function *displayRoll()*.  Here we pass into the function a tuple but do not specify names for the components of the tuple.  So, we have to resort to default parameter names when we work with the tuple components in the function
 
 We finish up the game of craps as a means to show how *switch*
 statements and *while* loops work in Swift:
 */

// play one game of craps
var myPoint = 0 // point if no win or loss on first roll
var gameStatus = Status.Continue // can contain Continue, Won or Lost

var roll = rollDice() // first roll of the dice
displayRoll(roll: roll) // display the two dice and the sum

// determine game status and point based on first roll
switch roll.sum {
// win on first roll
case DiceNames.Seven.rawValue, DiceNames.YoLeven.rawValue:
    gameStatus = Status.Won
// lose on first roll
case DiceNames.SnakeEyes.rawValue, DiceNames.Trey.rawValue,
     DiceNames.BoxCars.rawValue:
    gameStatus = Status.Lost
// did not win or lose, so remember point
default:
    gameStatus = Status.Continue // game is not over
    myPoint = roll.sum // remember the point
    print("Point is \(myPoint)")
}

// while game is not complete
while gameStatus == Status.Continue
{
    roll = rollDice() // first roll of the dice
    displayRoll(roll: roll) // display the two dice and the sum
    
    // determine game status
    if roll.sum == myPoint { // won by making point
        gameStatus = Status.Won
    } else {
        if (roll.sum == DiceNames.Seven.rawValue) { // lost by rolling 7
            gameStatus = Status.Lost
        }
    }
}

// display won or lost message
if gameStatus == Status.Won {
    print("Player wins")
} else {
    print("Player loses")
}


