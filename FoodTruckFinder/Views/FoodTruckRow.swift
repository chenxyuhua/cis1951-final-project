//
//  FoodTruckRow.swift
//  FoodTruckFinder
//
//  Created by Emily Yu on 4/19/24.
//

import SwiftUI
import CoreLocation

struct FoodTruckRow: View {
    let truck: FoodTruck
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(truck.name).font(.headline)
            // More information about the food truck could be added here
        }
        // Any styling modifiers would be added here.
    }
}

struct FoodTruckRow_Previews: PreviewProvider {
    static var previews: some View {
        // Create a mock FoodTruck object
        let sampleTruck = FoodTruck(
            id: UUID(),
            name: "Tasty Truck",
            location: CLLocation(latitude: 35.6895, longitude: 139.6917),
            hours: "10am - 9pm",
            averagePrice: 8.50,
            category: "Japanese Cuisine",
            isFavorite: false
        )
        
        FoodTruckRow(truck: sampleTruck)
            .previewLayout(.sizeThatFits)
    }
}
