//
//  TripName.swift
//  BikingUI
//
//  Created by Sagar on 2021-05-25.
//

import FirebaseFirestore
import MapKit
import SwiftUI

struct TripName: View {
    @State var trip: Activity

    var body: some View {
        VStack(alignment: .leading, spacing: 3) {
            TextField("Monday Morning Trip", text: $trip.tripName)
                .font(.system(size: 24, weight: .medium, design: .default))
                .foregroundColor(.primary)

            Text(trip.date.format())
                .font(.system(size: 15, weight: .regular, design: .default))
                .foregroundColor(.secondary)

            Map_Summary(coordinates: trip.coordinates.map { $0.toCLLocationCoordinate() })
                .frame(height: 400)
                .padding(.top)
        }
    }
}

struct TripName_Previews: PreviewProvider {
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

        TripName(trip: trip)
    }
}
