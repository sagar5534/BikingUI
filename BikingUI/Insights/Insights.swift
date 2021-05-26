//
//  History.swift
//  BikingUI
//
//  Created by Sagar on 2020-09-16.
//

import SwiftUI

struct Insights: View {
    @State var trips: Trips = []

    var body: some View {
        VStack {
            InsightScoreboard()
                .boxShadow()
                .padding(.horizontal)
                .padding(.top)

            InsightHistory(trips: trips)
                .boxShadow()
                .padding(.horizontal)

            Spacer()
        }
        .navigationTitle("Insights")
    }
}

struct History_Previews: PreviewProvider {
    static var previews: some View {
        let trips: Trips = [
            Activity(tripName: "Monday Afternoon", distance: 10.55, movingTime: 1000, totalTime: 1200, avgSpeed: 20.3, fastestSpeed: 70.0),
            Activity(tripName: "Sunday Afternoon", distance: 12.55, movingTime: 2000, totalTime: 2500, avgSpeed: 17.1, fastestSpeed: 30),
        ]

        NavigationView {
            Insights(trips: trips)
        }
    }
}
