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
        location = destination
    }
    
    func distanceTo(target : String, currentLocation : String) -> Int {
        return data.knownDistances[currentLocation]![target]!
    }
    
    func knownDestinations() -> [String] {
        return ["St. Louis", "Phoenix", "Denver", "SLC", "Chicago"]
    }
}
