//
//  LocationManager.swift
//  FoodTruckFinder
//
//  Created by Emily Yu on 4/19/24.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private let locationManager = CLLocationManager()
    @Published var location: CLLocation?
    
    override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization() // Request permission
        self.locationManager.startUpdatingLocation() // Start location updates
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first // Update your published location
        
//        if let location = locations.first { // Safely unwrap the first location if it exists
//            print("Location coordinates are \(location.coordinate.latitude), \(location.coordinate.longitude)")
//        } else {
//            print("No locations available.")
//        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error getting location: \(error)")
    }
    
    // For location permissions and sharing
    
    func requestLocationPermission() {
        locationManager.requestWhenInUseAuthorization()
        
    }
    
    func getLocation() {
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse || status == .authorizedAlways {
            manager.startUpdatingLocation()
        }
    }
}
