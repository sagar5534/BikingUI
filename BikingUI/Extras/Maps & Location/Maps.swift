//
//  Maps.swift
//  BikingUI
//
//  Created by Sagar on 2020-09-23.
//

import Foundation
import MapKit
import SwiftUI

struct Map: UIViewRepresentable {
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
    @Binding var coordinates: [CLLocationCoordinate2D]
    let mapViewDelegate = MapSummaryDelegate()

    func makeUIView(context _: Context) -> MKMapView {
        let mapView = MKMapView(frame: UIScreen.main.bounds)

        mapView.showsUserLocation = true
        mapView.setUserTrackingMode(.followWithHeading, animated: true)
        mapView.isZoomEnabled = true
        mapView.isScrollEnabled = true
        mapView.isUserInteractionEnabled = true
        mapView.showsTraffic = true

        return mapView
    }

    func updateUIView(_ view: MKMapView, context _: Context) {
        view.delegate = mapViewDelegate
        view.translatesAutoresizingMaskIntoConstraints = false
        addRoute(to: view)
    }

    func addRoute(to view: MKMapView) {
        if !view.overlays.isEmpty {
            view.removeOverlays(view.overlays)
        }
        let route = makeRoute()
        view.addOverlay(route)
    }

    func makeRoute() -> MKPolyline {
        return MKPolyline(coordinates: &coordinates, count: coordinates.count)
    }
}

struct Map_Summary: UIViewRepresentable {
    @Binding var coordinates: [CLLocationCoordinate2D]
    @State var spacing: CGFloat = 15
    let mapViewDelegate = MapSummaryDelegate()

    func makeUIView(context _: Context) -> MKMapView {
        let mapView = MKMapView(frame: .zero)

        mapView.isUserInteractionEnabled = false

        return mapView
    }

    func updateUIView(_ view: MKMapView, context _: Context) {
        view.delegate = mapViewDelegate
        view.translatesAutoresizingMaskIntoConstraints = false
        addRoute(to: view)
    }

    func addRoute(to view: MKMapView) {
        if !view.overlays.isEmpty {
            view.removeOverlays(view.overlays)
        }

        let route = makeRoute()
        let mapRect = route.boundingMapRect
        view.setVisibleMapRect(
            mapRect,
            edgePadding: UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing),
            animated: true
        )
        view.addOverlay(route)
    }

    func makeRoute() -> MKPolyline {
        return MKPolyline(coordinates: &coordinates, count: coordinates.count)
    }
}

class MapSummaryDelegate: NSObject, MKMapViewDelegate {
    func mapView(_: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.fillColor = UIColor.red.withAlphaComponent(0.3)
        renderer.strokeColor = UIColor.red.withAlphaComponent(0.6)
        renderer.lineWidth = 7
        return renderer
    }
}
