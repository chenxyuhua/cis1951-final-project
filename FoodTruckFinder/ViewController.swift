//
//  ViewController.swift
//  FoodTruckFinder
//
//  Created by Cindy Su on 4/19/24.
//

import Foundation
import UIKit
import MapKit

class ViewController: UIViewController {
    
//    var mapView: MKMapView!;  // Implicitly Unwrapped Optional
    
    var mapView: MKMapView = MKMapView();
    
    // When map laods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMapView()
        addFoodTruckPins()
    }

    func setupMapView() {
        mapView.frame = self.view.bounds
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        view.addSubview(mapView)
    }

    func addFoodTruckPins() {
        let foodtrucks = [
            ("Joe's Diner", CLLocationCoordinate2D(latitude: 35.681236, longitude: 139.764936)),
            ("The Great Burger", CLLocationCoordinate2D(latitude: 35.689487, longitude: 139.691706))
        ]
        
        for truck in foodtrucks {
            let annotation = MKPointAnnotation()
            annotation.title = truck.0
            annotation.coordinate = truck.1
            mapView.addAnnotation(annotation)
        }
    }
}
