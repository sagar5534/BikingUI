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
        curSpeed = location.speed * 3.6
        distance += location.distance(from: self.locations.last ?? location) / 1000
        self.locations.append(location)
        avgSpeed = avgSpeed + (((location.speed * 3.6) - avgSpeed) / Double(self.locations.count))
    }
}

struct Map: UIViewRepresentable {
    private var locationManager = CoreLocation()

    func makeUIView(context _: Context) -> MKMapView {
        let mapView = MKMapView(frame: UIScreen.main.bounds)

        mapView.showsUserLocation = true
        mapView.userTrackingMode = .followWithHeading

        mapView.isZoomEnabled = false
        mapView.isScrollEnabled = false
        mapView.isUserInteractionEnabled = false

        mapView.setUserTrackingMode(.followWithHeading, animated: true)
        mapView.showsCompass = true
        mapView.userActivity = .init(activityType: "Bike")

        return mapView
    }

    func updateUIView(_: MKMapView, context _: Context) {}
}
