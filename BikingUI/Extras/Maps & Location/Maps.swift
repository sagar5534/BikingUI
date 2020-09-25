//
//  Maps.swift
//  BikingUI
//
//  Created by Sagar on 2020-09-23.
//

import SwiftUI
import MapKit
import Foundation


struct Map: UIViewRepresentable {
    private var locationManager = CoreLocation()

    func makeUIView(context _: Context) -> MKMapView {
        let mapView = MKMapView(frame: UIScreen.main.bounds)

        mapView.showsUserLocation = true
        mapView.setUserTrackingMode(.follow, animated: true)

        mapView.isZoomEnabled = false
        mapView.isScrollEnabled = false
        mapView.isUserInteractionEnabled = false

        return mapView
    }

    func updateUIView(_: MKMapView, context _: Context) {}
}


struct Map_Tracking: UIViewRepresentable {
    private var locationManager = CoreLocation()

    func makeUIView(context _: Context) -> MKMapView {
        let mapView = MKMapView(frame: UIScreen.main.bounds)

        mapView.showsUserLocation = true
        mapView.setUserTrackingMode(.followWithHeading, animated: true)
        mapView.isZoomEnabled = true
        mapView.isScrollEnabled = true
        mapView.isUserInteractionEnabled = true

        return mapView
    }

    func updateUIView(_: MKMapView, context _: Context) {}
}

struct Map_Summary: UIViewRepresentable {
    private var locationManager = CoreLocation()

    func makeUIView(context _: Context) -> MKMapView {
        let mapView = MKMapView(frame: UIScreen.main.bounds)

        mapView.showsUserLocation = false

        mapView.isZoomEnabled = false
        mapView.isScrollEnabled = false
        mapView.isUserInteractionEnabled = false

        return mapView
    }

    func updateUIView(_: MKMapView, context _: Context) {}
}
