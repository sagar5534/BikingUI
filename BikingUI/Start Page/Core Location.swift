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

    var count = 0
    var avg = 0.0
    
    @Published var elevation: [Double] = []
    @Published var locations: [CLLocation] = []

    private var baseElevation = 0.0
    private let locationManager = CLLocationManager()

    override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.startUpdatingLocation()
    }
}

extension CoreLocation: CLLocationManagerDelegate {
    func locationManager(_: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        self.curSpeed = location.speed * 3.6
        self.distance += location.distance(from: self.locations.last ?? location) / 1000
        self.locations.append(location)

        if self.baseElevation == 0 {
            self.baseElevation = location.altitude
        }

        if count < 4{
            count += 1
            let x = location.altitude - self.baseElevation
            self.avg = self.avg + (( x - self.avg ) / Double(self.count))
        }else{
            self.elevation.append(self.avg)
            count = 0
        }
        

        self.avgSpeed = self.avgSpeed + (((location.speed * 3.6) - self.avgSpeed) / Double(self.locations.count))
    }
}

struct Map: UIViewRepresentable {
    var locationManager = CoreLocation()

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
