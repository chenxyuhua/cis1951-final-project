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
            VStack(alignment: .leading, spacing: 10) {
                Group {
                    HStack {
                        Text("Hours:")
                            .bold()
                        Text(foodTruck.hours)
                    }

                    HStack {
                        Text("Category:")
                            .bold()
                        Text(foodTruck.category)
                    }

                    HStack {
                        Text("Average Price:")
                            .bold()
                        Text("$\(foodTruck.averagePrice, specifier: "%.2f")")
                    }
                    
                    HStack {
                        Text("Favorite:")
                            .bold()
                        if foodTruck.isFavorite {
                            Image(systemName: "heart.fill")
                                .foregroundColor(.red)
                        } else {
                            Image(systemName: "heart")
                        }
                    }

                    Text("Location:")
                        .bold()
                    HStack {
                        Text("Latitude:")
                            .bold()
                        Text("\(foodTruck.location.coordinate.latitude)")
                    }
                    
                    HStack {
                        Text("Longitude:")
                            .bold()
                        Text("\(foodTruck.location.coordinate.longitude)")
                    }
                }
                Spacer()
            }
            .padding([.leading, .top, .bottom])
            .navigationBarTitle(Text(foodTruck.name), displayMode: .inline)
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

