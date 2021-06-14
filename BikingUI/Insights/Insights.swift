//
//  History.swift
//  BikingUI
//
//  Created by Sagar on 2020-09-16.
//

import FirebaseFirestore
import MapKit
import SwiftUI

struct Insights: View {
    @State var trips: Trips = [
        Activity(tripName: "Monday Afternoon",
                 distance: 10.55,
                 movingTime: 1000,
                 totalTime: 1200,
                 speed: 20.3,
                 pace: 45,
                 elevation: 70.0,
                 date: Timestamp()),
        Activity(tripName: "Sunday Afternoon",
                 distance: 12.55,
                 movingTime: 2000,
                 totalTime: 2500,
                 speed: 20.3,
                 pace: 45,
                 elevation: 70.0,
                 date: Timestamp()),
        Activity(tripName: "Monday Afternoon",
                 distance: 10.55,
                 movingTime: 1000,
                 totalTime: 1200,
                 speed: 20.3,
                 pace: 45,
                 elevation: 70.0,
                 date: Timestamp()),
        Activity(tripName: "Sunday Afternoon",
                 distance: 12.55,
                 movingTime: 2000,
                 totalTime: 2500,
                 speed: 20.3,
                 pace: 45,
                 elevation: 70.0,
                 date: Timestamp()),
    ]

    var body: some View {
        ScrollView {
            InsightScoreboard()
                .padding(.top)
                .padding(.horizontal)

            InsightHistory(trips: trips)
                .padding(.top)
                .padding(.horizontal)

            Spacer()
        }
    }
}

struct History_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Insights()
        }
    }
}
