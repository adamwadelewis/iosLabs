//: Playground - noun: a place where people can play

import Cocoa

var comps =  DateComponents()
comps.year = 1964
comps.month = 8
comps.day=28
comps.hour=0
comps.minute = 0

var g = Calendar(identifier: Calendar.Identifier.gregorian)

var dateOfBirth = g.date(from: comps)

var now = Date()

let secs = now.timeIntervalSince(dateOfBirth!)

let age = (secs / 60 * 60 * 24 * 265)

print("I have been alive for \(secs) seconds")

print("I am \(age) years old")
