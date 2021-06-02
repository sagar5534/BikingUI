//
//  TripStats.swift
//  BikingUI
//
//  Created by Sagar on 2021-05-25.
//

import SwiftUI
import FirebaseFirestore

struct TripStats: View {
    @State var trip: Activity

    var body: some View {
        GroupBox(label: Label("Details", systemImage: "rosette")) {
            HStack(alignment: .top) {
                InfoLabel(value: trip.distance.format(precision: 1), unit: "Kilometers")
                    .frame(minWidth: 0, maxWidth: .infinity)
                Divider()
                InfoLabel(value: String(trip.movingTime.toTime(pad: false)), unit: "Moving Time")
                    .frame(minWidth: 0, maxWidth: .infinity)
            }
            .fixedSize(horizontal: false, vertical: true)

            Divider()
                .padding(.horizontal)

            HStack(alignment: .top) {
                InfoLabel(value: String(trip.pace.toTime(pad: false)), unit: "Pace")
                    .frame(minWidth: 0, maxWidth: .infinity)
                Divider()
                InfoLabel(value: trip.speed.format(precision: 1), unit: "Speed")
                    .frame(minWidth: 0, maxWidth: .infinity)
                Divider()

                let elevLabel = (trip.elevation > 0 ? "+" : "-") + trip.elevation.format(precision: 0) + "m"
                InfoLabel(value: elevLabel, unit: "Elevation")
                    .frame(minWidth: 0, maxWidth: .infinity)
            }
            .fixedSize(horizontal: false, vertical: true)
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
