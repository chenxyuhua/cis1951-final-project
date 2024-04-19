//
//  FoodTruckRow.swift
//  FoodTruckFinder
//
//  Created by Emily Yu on 4/19/24.
//

import SwiftUI
import CoreLocation

struct FoodTruckRow: View {
    @ObservedObject var viewModel: FoodTruckViewModel
    let truck: FoodTruck
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(truck.name).font(.headline)
                // More information about the food truck could be added here
            }
            Spacer()
            Button(action: {
                viewModel.toggleFavorite(truck)
            }) {
                Image(systemName: truck.isFavorite ? "heart.fill" : "heart")
                    .foregroundColor(truck.isFavorite ? .red : .gray)
            }
        }
        // Add any styling modifiers to style the row here.
    }
}

struct FoodTruckRow_Previews: PreviewProvider {
    static var previews: some View {
        // Create a mock instance of FoodTruckViewModel
        let viewModel = FoodTruckViewModel()
        
        // Add a sample truck to the viewModel
        viewModel.foodTrucks.append(FoodTruck(
            name: "Tasty Truck",
            location: CLLocation(latitude: 35.6895, longitude: 139.6917),
            hours: "10am - 9pm",
            averagePrice: 8.50,
            category: "Japanese Cuisine",
            isFavorite: true
        ))

        if let sampleTruck = viewModel.foodTrucks.first {
            FoodTruckRow(viewModel: viewModel, truck: sampleTruck)
                .previewLayout(.sizeThatFits)
        }
    }
}
