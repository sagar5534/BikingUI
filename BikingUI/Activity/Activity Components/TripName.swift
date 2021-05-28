//
//  TripName.swift
//  BikingUI
//
//  Created by Sagar on 2021-05-25.
//

import SwiftUI
import FirebaseFirestore

struct TripName: View {
    @State var trip: Activity

    var body: some View {
        GroupBox(label: Label("Trip Name", systemImage: "mappin.and.ellipse")) {
            VStack(alignment: .leading, spacing: 3) {
                Text(trip.date.format())
                    .font(.system(size: 16 * 1, weight: .semibold, design: .rounded))

                TextField("Monday Morning Trip", text: $trip.tripName)
                    .font(.system(size: 24 * 1, weight: .bold, design: .rounded))
            }
        }
        .groupBoxStyle(InfoCardGroupBox(color: .blue))
    }
}



private struct InfoCardGroupBox: GroupBoxStyle {
    var color: Color

    @ScaledMetric var size: CGFloat = 1

    func makeBody(configuration: Configuration) -> some View {
        GroupBox(label: HStack {
            configuration.label
                .foregroundColor(color)
                .scaledToFit()
                .minimumScaleFactor(0.5)
                .lineLimit(2)
            Spacer()
        }) {
            configuration.content
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
