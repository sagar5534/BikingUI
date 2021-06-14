//
//  TripStats.swift
//  BikingUI
//
//  Created by Sagar on 2021-05-25.
//

import FirebaseFirestore
import SwiftUI

struct TripStats: View {
    @State var trip: Activity

    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]

    var body: some View {
        ContentBox(label: "Details") {
            
            LazyVGrid(columns: columns, alignment: .center, spacing: 15) {
                let elevLabel = (trip.elevation > 0 ? "+" : "-") + trip.elevation.format(precision: 0)

                StatsBox(label: "Distance", image: "flame", value: trip.distance.format(precision: 1), unit: "Km")
                StatsBox(label: "Moving Time", image: "arrowtriangle.right.circle", value: String(trip.movingTime.toTime(pad: false)), unit: "")

                StatsBox(label: "Speed", image: "timer", value: trip.speed.format(precision: 1), unit: "Km/h")
                StatsBox(label: "Pace", image: "stopwatch", value: String(trip.pace.toTime(pad: false)), unit: "")

                StatsBox(label: "Elevation", image: "arrow.triangle.swap", value: elevLabel, unit: "Meters")
            }
        }
    }
}

private struct StatsBox: View {
    var label: String = ""
    var image: String = ""
    var value: String = ""
    var unit: String = ""

    var body: some View {
        GroupBox(label: Label(
            title: { Text(label) },
            icon: { Image(systemName: image)
            }
        ), content: {
            InfoTextView(value: value, unit: unit)
                .padding(.top)
        })
    }
}

private struct InfoLabel: View {
    var value: String
    var unit: String

    @ScaledMetric var size: CGFloat = 1

    @ViewBuilder
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Text(value)
                .font(.system(size: 24, weight: .bold, design: .default))

            Text(unit)
                .font(.system(size: 15, weight: .regular, design: .default))
                .foregroundColor(.secondary)
                .lineLimit(2)
                .fixedSize(horizontal: false, vertical: true)
                .multilineTextAlignment(.center)

            Spacer(minLength: 0)
        }
    }
}

struct TripStats_Previews: PreviewProvider {
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

        TripStats(trip: trip)
    }
}
