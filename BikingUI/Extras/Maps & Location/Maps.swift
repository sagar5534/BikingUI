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
    
    @Binding var locations: [CLLocation]
    let mapViewDelegate = MapSummaryDelegate()

    func makeUIView(context: Context) -> MKMapView {
        
        let mapView = MKMapView(frame: .zero)

        mapView.isUserInteractionEnabled = false
        
        return mapView
    }

    func updateUIView(_ view: MKMapView, context: Context) {
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
        view.setVisibleMapRect(mapRect, edgePadding: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10), animated: true)
        view.addOverlay(route)
    }
    
    func makeRoute() -> MKPolyline{
        var coordinates = locations.map({(location: CLLocation) -> CLLocationCoordinate2D in return location.coordinate})
        return MKPolyline(coordinates: &coordinates, count: locations.count)
    }
}

class MapSummaryDelegate: NSObject, MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.fillColor = UIColor.red.withAlphaComponent(0.5)
        renderer.strokeColor = UIColor.red.withAlphaComponent(0.8)
        return renderer
    }
}

struct Maps_Previews: PreviewProvider {
    static var previews: some View {
        
        let locations = [
            CLLocation(latitude: 32.7767, longitude: -96.7970),         /* San Francisco, CA */
            CLLocation(latitude: 37.7833, longitude: -122.4167),        /* Dallas, TX */
            CLLocation(latitude: 42.2814, longitude: -83.7483),         /* Ann Arbor, MI */
            CLLocation(latitude: 32.7767, longitude: -96.7970)          /* San Francisco, CA */
        ]
        
        Map_Summary(locations: .constant(locations))
    }
}
