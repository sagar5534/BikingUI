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
            HStack {
                TextField("Monday Morning Trip", text: $trip.tripName) { bool in
                    print(bool)
                } onCommit: {
                    print("Commit activity name: " + trip.tripName)
                }
                .font(.system(size: 24, weight: .medium, design: .default))
                .foregroundColor(.primary)

                Image(systemName: "pencil")
                    .font(.system(size: 24, weight: .medium, design: .default))
            }

            Text(trip.date.format())
                .font(.system(size: 15, weight: .regular, design: .default))
                .foregroundColor(.secondary)

            Map_Summary(coordinates: trip.coordinates.map { $0.toCLLocationCoordinate() })
                .frame(height: 450)
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
            date: Timestamp(seconds: 1_592_095_365, nanoseconds: 0)
        )

        TripName(trip: trip)
    }
}
