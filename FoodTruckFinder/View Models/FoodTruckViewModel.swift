//
//  FoodTruckViewModel.swift
//  FoodTruckFinder
//
//  Created by 陈昱桦 on 4/14/24.
//

import Foundation
import Combine

class FoodTruckViewModel: ObservableObject {
    @Published var foodTrucks: [FoodTruck] = []
    @Published var favorites: [FoodTruck] = []

    func addFoodTruck(_ truck: FoodTruck) {
        foodTrucks.append(truck)
        saveFoodTrucks()
    }

    // Loads food trucks from persistent storage
    func loadFoodTrucks() {
    }

    // Saves food trucks to persistent storage
    func saveFoodTrucks() {
    }

    class FoodTruckViewModel: ObservableObject {
        @Published var foodTrucks: [FoodTruck] = []

        func toggleFavorite(_ truck: FoodTruck) {
            if let index = foodTrucks.firstIndex(where: { $0.id == truck.id }) {
                foodTrucks[index].isFavorite.toggle()
            }
        }
    }
}
