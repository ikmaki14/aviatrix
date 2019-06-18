//
//  Aviatrix.swift
//  AviatrixApp
//
//  Created by Amy Holt on 6/10/18.
//  Copyright © 2018 Amy Holt. All rights reserved.
//

import Foundation

class Aviatrix {
    
    let data = AviatrixData()
    
    var author = ""
    var location = "St. Louis"
    
    var running = false
    var distanceTraveled = 0
    var maxFuel = 5000
    var fuelLevel = 5000.0
    var milesPerGallon = 0.3    // mpg = 0.55 - (Number of Gallons)x(0.00005)
    var fuelCost = 0.0
    
    init(authorName : String) {
        author = authorName
    }
    
    func start() -> Bool {
        running = true
        return running
    }
    
    func refuel() -> Double {
        let gallonsToPurchase = 5000.0 - fuelLevel
        fuelLevel = 5000.0
        fuelCost = data.fuelPrices[location]! * Double(gallonsToPurchase)
        return gallonsToPurchase
    }
    
    func flyTo(destination : String) {
        distanceTraveled += data.knownDistances[location]![destination]!
        fuelLevel -= Double(distanceTraveled) / milesPerGallon
        location = destination
    }
    
    func distanceTo(target : String, currentLocation : String) -> Int {
        return data.knownDistances[currentLocation]![target]!
    }
    
    func knownDestinations() -> [String] {
        return ["St. Louis", "Phoenix", "Denver", "SLC", "Chicago"]
    }
}
