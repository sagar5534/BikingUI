//
//  Test.swift
//  BikingUI
//
//  Created by Sagar on 2020-09-23.
//

import Foundation
import FirebaseFirestoreSwift
import Firebase
import FirebaseFirestore
import MapKit

struct User: Identifiable, Codable {
    
    @DocumentID var id: String? = UUID().uuidString
    var name: String
    var distance: Double
    var movingTime: Double
    var trips: Int
    var avgSpeed: Double
    var isKm: Bool
    
    init() {
        self.id = UUID().uuidString
        self.name = ""
        self.distance = 0
        self.movingTime = 0
        self.trips = 0
        self.avgSpeed = 0
        self.isKm = true
    }
    
}

struct Activity: Identifiable, Codable {
        
    @DocumentID var id: String? = UUID().uuidString
    var tripName: String
    var distance: Double
    var movingTime: Double
    var totalTime: Double
    var avgSpeed: Double
    var fastestSpeed: Double
    var date: Timestamp
    
    init() {
        self.id = UUID().uuidString
        self.tripName = ""
        self.distance = 0
        self.movingTime = 0
        self.totalTime = 0
        self.avgSpeed = 0
        self.fastestSpeed = 0
        self.date = Timestamp()
    }
    
    init(location: CoreLocation) {
        self.id = UUID().uuidString
        self.tripName = ""
        self.distance = location.distance
        self.movingTime = 0
        self.totalTime = 0
        self.avgSpeed = location.avgSpeed
        self.fastestSpeed = 0
        self.date = Timestamp()
    }
}
