//
//  Test.swift
//  BikingUI
//
//  Created by Sagar on 2020-09-23.
//

import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift
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
    @DocumentID var id: String? = UUID().uuidString
    var tripName: String
    var distance: Double
    var movingTime: Double
    var totalTime: Double
    var speed: Double
    var pace: Double
    var elevation: Double
    var date: Timestamp
//    var coordinates: [GeoPoint]

    init() {
        id = UUID().uuidString
        tripName = ""
        distance = 0
        movingTime = 0
        totalTime = 0
        speed = 0
        pace = 0
        elevation = 0
        date = Timestamp()
//        coordinates = []
    }

    init(
        tripName: String,
        distance: Double,
        movingTime: Double,
        totalTime: Double,
        speed: Double,
        pace: Double,
        elevation: Double,
        date: Timestamp
    ) {
        self.tripName = tripName
        self.distance = distance
        self.movingTime = movingTime
        self.totalTime = totalTime
        self.speed = speed
        self.pace = pace
        self.elevation = elevation
        self.date = date
    }

    init(location: CoreLocation, timer: StopWatchManager) {
        id = UUID().uuidString
        tripName = ""
        distance = location.distance
        movingTime = timer.movingTime
        totalTime = timer.totalTime
        speed = location.avgSpeed
        pace = 0
        elevation = 0
        date = Timestamp()
//        coordinates = location.coordinates.map{ $0.toGeoPoint() }
    }
}
