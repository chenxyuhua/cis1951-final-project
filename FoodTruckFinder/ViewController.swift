//
//  ViewController.swift
//  FoodTruckFinder
//
//  Created by Cindy Su on 4/19/24.
//

import Foundation
import UIKit

class ViewController: UIViewController {
    var locationManager = LocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.requestLocationPermission()
    }
    
    func someMethodToGetLocation() {
        locationManager.getLocation()
    }
}
