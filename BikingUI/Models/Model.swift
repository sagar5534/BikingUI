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
    
    //Global Details
    var distance: Double
    var movingTime: Double
    var trips: Int
    var avgSpeed: Double
    var activity: [Activity]
}

struct Activity: Identifiable {
    var id: String = UUID().uuidString
    var tripName: String
    var distance: Double
    var movingTime: Double
    var totalTime: Double
}
