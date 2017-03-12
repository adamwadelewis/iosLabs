//
//  main.swift
//  lab07.account
//
//  Created by Adam Lewis on 3/11/17.
//  Copyright © 2017 Adam Lewis. All rights reserved.
//
/**
 There's a lot going on in this example. First note the syntax for defining a new class. By convention, class names start with capitalized letters. Note also that the preference is for the use of camel-case naming in identifiers. The body of the class is defined within the braces.
 
 Classes can be defined to be one of public, internal, and private. Public and private classes operate similar to their equivalents in C++. Internal classes are visible within a project. The default is for classes to be internal.
 
 We have two properties on the class: a name and a balance. Note that both properties are public. However, we see some odd syntax on the definition of the balance property. This is saying that the property is public while its setter method is private.
 
 The class constructor is the init() method. Note that we were required to initialize properties when we declared them. However, we can override these values by providing an initializer method. Not defining an initializer will tell the Swift run-time to provide a default initializer that just uses the default values provided when you defined properties.
 
 The public contract for this class is defined by the Deposit() and Withdraw() functions. Note that neither of these methods return values. If we need to do so, we must specify the return type in the method header with a "->" following the parameters and include a return statement.
 */
import Foundation


public class Account {
    public var name: String = ""
    public private(set) var balance = 0.0
    public init(name: String, balance: Double) {
        self.name = name
        if balance > 0.0 {
            self.balance = balance
        }
        print(name)
        print(balance)
    }
    public func Deposit(amount: Double) {
        if amount > 0.0 {
            balance = balance + amount
        }
    }
    public func Withdraw(amount: Double) {
        if amount > 0.0 {
            if balance - amount >= 0.0 {
                balance = balance - amount
            }
        }
    }
}


// create and configure an NSNumberFormatter for currency values
var formatter = NumberFormatter()
formatter.numberStyle = NumberFormatter.Style.currency

// function to return String representation of an Account's information
func formatAccountString(account: Account) -> String {
    let acctBalance = account.balance as NSNumber
    return account.name + "'s balance: " +
        formatter.string(from: acctBalance)!
}

print("Now create accounts")
// create two account objects
let account1 = Account(name: "Jane Green", balance: 50.00)
print(account1)

let account2 = Account(name: "John Blue", balance: -7.53)
print(account2)

// display initial balance of each Account
print(formatAccountString(account: account1))

print(formatAccountString(account: account2))

