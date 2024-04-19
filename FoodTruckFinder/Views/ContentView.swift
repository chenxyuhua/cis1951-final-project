//
//  ContentView.swift
//  FoodTruckFinder
//
//  Created by Cindy Su on 4/19/24.
//

import Foundation
import SwiftUI

struct ContentView: View {
    @ObservedObject var foodTruckViewModel = FoodTruckViewModel()
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor.white
    }
    
    var body: some View {
        TabView {
            HomeView(viewModel: foodTruckViewModel)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            SearchView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
        
            FavoritesView()
                .tabItem {
                    Label("Favorites", systemImage: "star.fill")
                }
            
            CreateView()
                .tabItem {
                    Label("Add", systemImage: "plus.circle.fill")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

