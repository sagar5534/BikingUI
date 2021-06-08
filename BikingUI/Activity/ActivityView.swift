//
//  ActivityView.swift
//  BikingUI
//
//  Created by Sagar on 2021-05-14.
//

import FirebaseFirestore
import Introspect
import MapKit
import SwiftUI

struct ActivityView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var trip: Activity

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            TripName(trip: trip)
                .padding()

//                Divider().padding(.horizontal)

            TripStats(trip: trip)
                .padding()

            Divider().padding(.horizontal)

            TripWeather()
                .padding()
        }

        .onAppear {
            UIScrollView.appearance().bounces = false
        }
    }
}

struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        let trip = Activity(
            tripName: "Monday Afternoon",
            distance: 10.55,
            movingTime: 1000,
            totalTime: 1200,
            speed: 20.3,
            pace: 1450,
            elevation: 70.0,
            date: Timestamp()
        )

        ActivityView(trip: trip)
    }
}
