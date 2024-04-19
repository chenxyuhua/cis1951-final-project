//
//  FoodTruckView.swift
//  FoodTruckFinder
//
//  Created by 陈昱桦 on 4/14/24.
//

import SwiftUI
import CoreLocation

struct FoodTruckView: View {
    let foodTruck: FoodTruck

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Hours: \(foodTruck.hours)")
                Text("Category: \(foodTruck.category)")
                Text("Average Price: $\(foodTruck.averagePrice, specifier: "%.2f")")

                Text("Location:")
                Text("Latitude: \(foodTruck.location.coordinate.latitude)")
                Text("Longitude: \(foodTruck.location.coordinate.longitude)")

                Spacer()
            }
            .padding(.horizontal, 0)
            .navigationBarTitle(Text("\(foodTruck.name)"), displayMode: .inline)
            .navigationBarItems(leading: backButton)
        }
    }

    private var backButton: some View {
        Button(action: {
            // Actions to pop to the previous view will be handled by the navigation view.
        }) {
            HStack {
                Image(systemName: "arrow.left")
                Text("Back")
            }
        }
    }
}

// A mock FoodTruck instance for previews
extension FoodTruck {
    static var mock: FoodTruck {
        return FoodTruck(
            id: UUID(),
            name: "Liam's Kitchen",
            location: CLLocation(latitude: 0, longitude: 0),
            hours: "10AM - 8PM",
            averagePrice: 10,
            category: "Chinese",
            isFavorite: true
        )
    }
}

// Update the preview provider for FoodTruckView
struct FoodTruckView_Previews: PreviewProvider {
    static var previews: some View {
        FoodTruckView(foodTruck: .mock)
    }
}

