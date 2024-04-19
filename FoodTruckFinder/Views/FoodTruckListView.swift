//
//  FoodTruckListView.swift
//  FoodTruckFinder
//
//  Created by Emily Yu on 4/19/24.
//

import SwiftUI
import CoreLocation

struct FoodTruckListView: View {
    @ObservedObject var viewModel: FoodTruckViewModel
    @Binding var searchText: String
    var userLocation: CLLocation?

    var filteredFoodTrucks: [FoodTruck] {
        viewModel.foodTrucks.filter { truck in
            searchText.isEmpty || truck.name.localizedCaseInsensitiveContains(searchText)
        }.sorted {
            // If userLocation is available, sort by proximity
            if let userLocation = userLocation {
                return $0.location.distance(from: userLocation) < $1.location.distance(from: userLocation)
            }
            return false
        }
    }

    var body: some View {
        List(filteredFoodTrucks) { truck in
            FoodTruckRow(viewModel: viewModel, truck: truck)
        }
    }
}

struct FoodTruckListView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = FoodTruckViewModel()
        viewModel.foodTrucks = [
            FoodTruck(
                id: UUID(),
                name: "Tasty Truck",
                location: CLLocation(latitude: 35.6895, longitude: 139.6917),
                hours: "10am - 9pm",
                averagePrice: 8.50,
                category: "Japanese Cuisine",
                isFavorite: true
            ),
            // Add more FoodTruck instances if needed
        ]

        let searchText = Binding.constant("")
        let userLocation = CLLocation(latitude: 34.0522, longitude: -118.2437)

        return FoodTruckListView(viewModel: viewModel, searchText: searchText, userLocation: userLocation)
            .previewLayout(.sizeThatFits)
    }
}
