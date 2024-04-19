//
//  FavoritesView.swift
//  FoodTruckFinder
//
//  Created by 陈昱桦 on 4/14/24.
//

import SwiftUI
import CoreLocation

struct FavoritesView: View {
    @ObservedObject var viewModel = FoodTruckViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.foodTrucks.filter { $0.isFavorite }) { truck in
                FoodTruckRow(viewModel: viewModel, truck: truck)
            }
            .navigationTitle("My Favorites")
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
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
                isFavorite: false
            ),
            FoodTruck(
                id: UUID(),
                name: "Burger Haven",
                location: CLLocation(latitude: 40.7128, longitude: -74.0060),
                hours: "11am - 11pm",
                averagePrice: 10.00,
                category: "Fast Food",
                isFavorite: true
            )
        ]

        return FavoritesView()
            .environmentObject(viewModel)
    }
}
