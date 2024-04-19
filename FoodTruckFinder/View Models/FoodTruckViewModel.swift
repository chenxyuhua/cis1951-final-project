//
//  FoodTruckViewModel.swift
//  FoodTruckFinder
//
//  Created by 陈昱桦 on 4/14/24.
//

import Foundation
import Combine
import MapKit
import CoreLocation

class FoodTruckViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    @Published var foodTrucks: [FoodTruck] = []
    @Published var favorites: [FoodTruck] = []
    @Published var userLocation: CLLocationCoordinate2D?
    
    private var locationManager = CLLocationManager()
    
    override init() {
        super.init()
        self.locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }

    func addFoodTruck(_ truck: FoodTruck) {
        foodTrucks.append(truck)
        if truck.isFavorite {
            favorites.append(truck)
        }
        saveFoodTrucks()
    }

    // Loads food trucks from persistent storage
    func loadFoodTrucks() {
        // SAMPLE DATA LOADING FOR TESTING HOME PAGE
        let sampleTruck1 = FoodTruck(
            name: "Liam's",
            location: CLLocation(latitude: 39.9526976, longitude: -75.1990490),
            hours: "9 AM to 5 PM except Weekends",
            averagePrice: 10.0,
            category: "Chinese",
            isFavorite: true
        )
        let sampleTruck2 = FoodTruck(
            name: "Halal Food Truck",
            location: CLLocation(latitude: 39.9512526, longitude: -75.1985373),
            hours: "9 AM to 5 PM",
            averagePrice: 8.0,
            category: "Halal",
            isFavorite: false
        )
        foodTrucks.append(sampleTruck1)
        foodTrucks.append(sampleTruck2)
    }

    // Saves food trucks to persistent storage
    func saveFoodTrucks() {
    }
    
    func toggleFavorite(_ truck: FoodTruck) {
        if let index = foodTrucks.firstIndex(where: { $0.id == truck.id }) {
            foodTrucks[index].isFavorite.toggle()
            saveFoodTrucks()
        }
    }
}
