//
//  Test.swift
//  BikingUI
//
//  Created by Sagar on 2020-09-23.
//

import Foundation
import MapKit

struct User: Identifiable, Codable {
    var id: String? = UUID().uuidString
    var name: String
    var distance: Double
    var movingTime: Double
    var trips: Int
    var avgSpeed: Double
    var isKm: Bool

    init() {
        id = UUID().uuidString
        name = ""
        distance = 0
        movingTime = 0
        trips = 0
        avgSpeed = 0
        isKm = true
    }
}

typealias Trips = [Activity]

struct Activity: Hashable, Identifiable, Codable {
    var id: String? = UUID().uuidString
    var tripName: String
    var distance: Double
    var movingTime: Double
    var totalTime: Double
    var avgSpeed: Double
    var fastestSpeed: Double
//    var date: Timestamp
//    var coordinates: [GeoPoint]

    init() {
        id = UUID().uuidString
        tripName = ""
        distance = 0
        movingTime = 0
        totalTime = 0
        avgSpeed = 0
        fastestSpeed = 0
//        date = Timestamp()
//        coordinates = []
    }

    init(
        tripName: String,
        distance: Double,
        movingTime: Double,
        totalTime: Double,
        avgSpeed: Double,
        fastestSpeed: Double
    ) {
        self.tripName = tripName
        self.distance = distance
        self.movingTime = movingTime
        self.totalTime = totalTime
        self.avgSpeed = avgSpeed
        self.fastestSpeed = fastestSpeed
    }

    init(location: CoreLocation, timer: StopWatchManager) {
        id = UUID().uuidString
        tripName = ""
        distance = location.distance
        movingTime = timer.movingTime
        totalTime = timer.totalTime
        avgSpeed = location.avgSpeed
        fastestSpeed = 0
//        date = Timestamp()
//        coordinates = location.coordinates.map{ $0.toGeoPoint() }
    }
}
