//
//  CreateView.swift
//  FoodTruckFinder
//
//  Created by 陈昱桦 on 4/14/24.
//

import SwiftUI
import CoreLocation

struct CreateView: View {
    @ObservedObject var viewModel: FoodTruckViewModel
    @ObservedObject var locationService: LocationManager

    @State private var name: String = ""
    @State private var hours: String = ""
    @State private var averagePrice: String = ""
    @State private var category: String = ""
    @State private var isFavorite: Bool = false
    @State private var latitude: CLLocationDegrees = 0.0
    @State private var longitude: CLLocationDegrees = 0.0

    var body: some View {
        VStack {
            Form {
                Text("Create New Food Truck")
                    .font(.title)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .listRowBackground(Color(.systemGroupedBackground))
                
                Section() {
                    TextField("Name", text: $name)
                    TextField("Hours", text: $hours)
                    TextField("Category", text: $category)
                    TextField("Average Price", text: $averagePrice)
                        .keyboardType(.decimalPad)
                    HStack {
                        Text("Favorite")
                        Spacer()
                        Image(systemName: isFavorite ? "heart.fill" : "heart")
                            .foregroundColor(isFavorite ? .red : .gray)
                            .onTapGesture {
                                isFavorite.toggle()
                            }
                    }
                    Section(header: Text("Location")) {
                        Text("Latitude: \(latitude)")
                        Text("Longitude: \(longitude)")
                    }
                }
                
                Button("Done") {
                    if let averagePriceDouble = Double(averagePrice) {
                        let newLocation = CLLocation(latitude: latitude, longitude: longitude)
                        let newTruck = FoodTruck(name: name, location: newLocation, hours: hours, averagePrice: averagePriceDouble, category: category, isFavorite: isFavorite)
                        viewModel.addFoodTruck(newTruck)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .center)
            }
        }
//        .onAppear {
//            locationService.startLocationServices()
//        }
        .tabItem {
            Label("Create", systemImage: "plus.circle.fill")
        }
    }
}

struct CreateView_Previews: PreviewProvider {
    static var previews: some View {
        CreateView(viewModel: FoodTruckViewModel(), locationService: LocationManager())
    }
}
