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
    var distanceTraveled = 0
    var maxFuel = 5000
    var fuelLevel = 5000.0
    var milesPerGallon = 0.4
    var fuelCost = 1.79
    
    init(authorName : String) {
        author = authorName
    }
    
    var running = false
    
    func start() -> Bool {
        running = true
        return running
    }
    
    func refuel() {
        
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
