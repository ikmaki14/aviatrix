//
//  main.swift
//  AviatrixApp
//
//  Created by Amy Holt on 6/10/18.
//  Copyright © 2018 Amy Holt. All rights reserved.
//

import Foundation

func gauges(myPlane : Aviatrix) {
    print("Reading the gauges...")
    print(" ")
    print("| Running:  | ✅")
    print("| Location:  | \(myPlane.location)")
    print("| Distance:  | \(myPlane.distanceTraveled) miles")
    print("| Fuel:      | \(myPlane.fuelLevel) gallons")
    print("| Max Fuel:  | \(myPlane.maxFuel) gallons")
    print("| MPG:       | \(myPlane.milesPerGallon)")
    print("| Fuel Bill: | \(myPlane.fuelCost)")
}

let data = AviatrixData()

func fly(myPlane : Aviatrix) {
    print("Where would you like to fly to? ")
    print(" ")
    let destinations = myPlane.knownDestinations()
    
    for (index, city) in destinations.enumerated() {
        let distance = myPlane.distanceTo(target : city, currentLocation : myPlane.location)
        print("\(index): \(city), \(distance) miles")
    }
    
    let response = Int(readLine()!)
    var desiredLocation = ""
    
    if response! >= 0 && response! < 5 {
        desiredLocation = myPlane.knownDestinations()[response!]
        
        print("🛫 Preparing for takeoff...")
        print("🛫 Flying...")
        
        if fuelCheck(myPlane: myPlane, destination : desiredLocation) {
            myPlane.flyTo(destination: desiredLocation)
            print("🛬 You've arrived in \(plane.location)!")
            gauges(myPlane: myPlane)
        }
    }
    else {
        print("⚠️Please enter a valid command⚠️")
    }
    
}

func refuel(myPlane : Aviatrix) {
    let refuelData = myPlane.refuel()
    
    print("Refueling...")
    print("⛽ Here in \(myPlane.location), jet fuel costs \(data.fuelPrices[myPlane.location]!)")
    print("⛽ You refueled \(refuelData) gallons totaling \(data.fuelPrices[myPlane.location]! * refuelData)")
}

func fuelCheck(myPlane : Aviatrix, destination : String) -> Bool {
    let distanceToTravel =  Double(myPlane.distanceTo(target : destination, currentLocation : myPlane.location))
    if myPlane.fuelLevel < distanceToTravel {
        print(" ")
        print("🔥 🔥 🔥 🔥 🔥 🔥 🔥 🔥 🔥 🔥")
        print("Oh no! You've run out of fuel and crashed on the way to \(myPlane.location)!")
        print("🔥 🔥 🔥 🔥 🔥 🔥 🔥 🔥 🔥 🔥")

        return false
    } else {
        return true
    }
}

var plane = Aviatrix(authorName : "Isabella")

print("Welcome to the Aviatrix Flight System by \(plane.author)")
print("You're currently in \(plane.location)")

var command = ""

while command != "q" {
    print(" ")
    print("What would you like to do?")
    print("a) 📊 check the plane gauges")
    print("b) 🛫 fly to a different city")
    print("c) ⛽ refuel")
    print("q) ❌ quit")
    print(" ")
    print("Action: ")
    command = readLine()!
    
    if command == "a" {
        gauges(myPlane: plane)
    }
    else if command == "b" {
        fly(myPlane: plane)
    }
    else if command == "c" {
        refuel(myPlane: plane)
    }
    else if command != "q" {
        print("⚠️Please enter a valid command⚠️")
    }
}

print(" ")
print("Thanks for flying with \(plane.author) airline!")
