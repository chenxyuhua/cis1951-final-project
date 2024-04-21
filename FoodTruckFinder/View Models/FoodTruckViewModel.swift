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

class FoodTruckViewModel: ObservableObject {
    @Published var foodTrucks: [FoodTruck] = []
    
    init() {
        loadFoodTrucks()
    }

    // Adds a new food truck
    func addFoodTruck(_ truck: FoodTruck) {
        foodTrucks.append(truck)
        saveFoodTrucks()
    }
    
    // Saves food trucks to persistent storage
    func saveFoodTrucks() {
        if let data = try? JSONEncoder().encode(foodTrucks) {
            UserDefaults.standard.set(data, forKey: "FoodTrucks")
        }
    }

    // Loads food trucks from persistent storage
    func loadFoodTrucks() {
        if let data = UserDefaults.standard.data(forKey: "FoodTrucks"),
           let savedFoodTrucks = try? JSONDecoder().decode([FoodTruck].self, from: data) {
            foodTrucks = savedFoodTrucks
        }
    }
    
    func toggleFavorite(_ truck: FoodTruck) {
        if let index = foodTrucks.firstIndex(where: { $0.id == truck.id }) {
            foodTrucks[index].isFavorite.toggle()
            saveFoodTrucks()
        }
    }
    
}
