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

    // Global Details
    var distance: Double
    var movingTime: Int
    var trips: Int
}

struct Activity: Identifiable {
    var id: String = UUID().uuidString
    var name: String

    // Global Details
    var distance: Double
    var movingTime: Int
    var trips: Int
}
