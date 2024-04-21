//
//  HomeView.swift
//  FoodTruckFinder
//
//  Created by 陈昱桦 on 4/14/24.
//


import SwiftUI
import MapKit
import CoreLocation

struct HomeView: View {
    
    @ObservedObject var viewModel: FoodTruckViewModel
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 39.952217, longitude: -75.193214),
        span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
    )
    
    var body: some View {
        NavigationView {
            Map(coordinateRegion: $region, annotationItems: viewModel.foodTrucks) { truck in
                MapAnnotation(coordinate: truck.location.coordinate) {
                    NavigationLink(destination: FoodTruckView(foodTruck: truck)) {
                        VStack {
                            Image(systemName: "mappin")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 20)
                                .foregroundColor(.red)
                            
                            Text(truck.name)
                                .font(.caption)
                                .bold()
                                .foregroundColor(.blue)
                                .padding(5)
                                .background(Color.white.opacity(0.65))
                                .cornerRadius(10)
                                .shadow(radius: 3)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.blue, lineWidth: 1)
                                )
                        }
                    }
                }
            }
            .ignoresSafeArea()
            .onAppear {
                viewModel.loadFoodTrucks()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: FoodTruckViewModel())
    }
}
