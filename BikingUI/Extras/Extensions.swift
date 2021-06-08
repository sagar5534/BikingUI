//
//  Extensions.swift
//  BikingUI
//
//  Created by Sagar on 2020-09-24.
//

import FirebaseFirestore
import Foundation
import MapKit

extension Double {
    func toTime(
        pad: Bool = true,
        units: NSCalendar.Unit = [NSCalendar.Unit.second, NSCalendar.Unit.minute, NSCalendar.Unit.hour]
    ) -> String {
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .positional
        formatter.includesApproximationPhrase = false
        formatter.includesTimeRemainingPhrase = false

        if pad { formatter.zeroFormattingBehavior = .pad }
        formatter.allowedUnits = units
        return formatter.string(from: self) ?? ""
    }

    func format(precision: Int = 2) -> String {
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = precision
        formatter.minimumFractionDigits = precision
        return formatter.string(for: self) ?? ""
    }

    func formatDistance(isKm: Bool) -> Double {
        return (self / (isKm ? 1000 : 1609))
    }

    func formatSpeed(isKmph: Bool) -> Double {
        return (self * (isKmph ? 3.6 : 2.237))
    }
}

extension Timestamp {
    func format() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.doesRelativeDateFormatting = true
        return formatter.string(from: dateValue())
    }
}


 extension GeoPoint {

    func toCLLocationCoordinate() -> CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: self.latitude, longitude: self.longitude)
    }

 }

 extension CLLocationCoordinate2D {

    func toGeoPoint() -> GeoPoint {
        return GeoPoint(latitude: self.latitude, longitude: self.longitude)
    }

 }
