//
//  UIApplicationExtension.swift
//  FoodTruckFinder
//
//  Created by Cindy Su on 4/21/24.
//

import Foundation
import UIKit

// Extension to add keyboard dismissal functionality
extension UIApplication {
    func endEditing() {
        guard let window = keyWindow else { return }
        let swipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipeToDismiss))
        swipe.direction = .down
        window.addGestureRecognizer(swipe)
    }
    
    @objc private func handleSwipeToDismiss() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

// Extension to add keyboard dismissal functionality
//extension UIApplication {
//    func endEditing() {
//        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
//    }
//}
