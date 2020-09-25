//
//  Core Location.swift
//  BikingUI
//
//  Created by Sagar on 2020-09-20.
//

import Combine
import CoreLocation
import Foundation
import MapKit
import SwiftUI
import SwiftUICharts
import UIKit

class CoreLocation: NSObject, ObservableObject {
    @Published var curSpeed: Double = 0
    @Published var avgSpeed: Double = 0
    @Published var distance: Double = 0
    @Published var locations: [CLLocation] = []

    private let locationManager = CLLocationManager()

    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
    }
}

extension CoreLocation: CLLocationManagerDelegate {
    func locationManager(_: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        curSpeed = location.speed
        distance += location.distance(from: self.locations.last ?? location)
        self.locations.append(location)
        avgSpeed = avgSpeed + ((location.speed - avgSpeed) / Double(self.locations.count))
    }
}
