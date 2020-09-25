//
//  Test.swift
//  BikingUI
//
//  Created by Sagar on 2020-09-23.
//

import Foundation

struct User: Identifiable {
    
    var id: String = UUID().uuidString
    var name: String
    var distance: Double
    var movingTime: Double
    var trips: Int
    var avgSpeed: Double
    var activity: [Activity]
    
    init() {
        self.id = ""
        self.name = ""
        self.distance = 0
        self.movingTime = 0
        self.trips = 0
        self.avgSpeed = 0
        self.activity = [Activity()]
    }
    
    internal init(id: String = UUID().uuidString, name: String, distance: Double, movingTime: Double, trips: Int, avgSpeed: Double, activity: [Activity]) {
        self.id = id
        self.name = name
        self.distance = distance
        self.movingTime = movingTime
        self.trips = trips
        self.avgSpeed = avgSpeed
        self.activity = activity
    }
    
}

struct Activity: Identifiable {

    var id: String = UUID().uuidString
    var tripName: String
    var distance: Double
    var movingTime: Double
    var totalTime: Double
    var avgSpeed: Double
    var fastestSpeed: Double
    
    init() {
        self.id = ""
        self.tripName = ""
        self.distance = 0
        self.movingTime = 0
        self.totalTime = 0
        self.avgSpeed = 0
        self.fastestSpeed = 0
    }
    
    internal init(id: String = UUID().uuidString, tripName: String, distance: Double, movingTime: Double, totalTime: Double, avgSpeed: Double, fastestSpeed: Double) {
        self.id = id
        self.tripName = tripName
        self.distance = distance
        self.movingTime = movingTime
        self.totalTime = totalTime
        self.avgSpeed = avgSpeed
        self.fastestSpeed = fastestSpeed
    }
    
}
