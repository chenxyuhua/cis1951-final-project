//
//  FoodTruck.swift
//  FoodTruckFinder
//
//  Created by 陈昱桦 on 4/14/24.
//

import Foundation
import CoreLocation

struct FoodTruck {
    let name: String
    let location: CLLocationCoordinate2D
    let hours: String
    let cuisine: String
    let avgPrice: Double?

    init(name: String, location: CLLocationCoordinate2D, hours: String, cuisine: String, avgPrice: Double? = nil) {
        self.name = name
        self.location = location
        self.hours = hours
        self.cuisine = cuisine
        self.avgPrice = avgPrice
    }
}
