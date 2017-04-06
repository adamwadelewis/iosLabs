//
//  main.swift
//  lab12
//
//  Created by Adam Lewis on 3/13/17.
//  Copyright © 2017 Adam Lewis. All rights reserved.
//

import Foundation

var myhost = Host()
var myname = myhost.localizedName
print("My host name is \(myname).")

myhost = Host.current();
myname = myhost.localizedName;
print("My host name is \(myname).")

