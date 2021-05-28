//
//  InsightHistory.swift
//  BikingUI
//
//  Created by Sagar on 2021-05-08.
//

import FirebaseFirestore
import SwiftUI

struct InsightHistory: View {
    @State var trips: Trips

    var body: some View {
        GroupBox(label:
            Text("Recent Trips")
        ) {
            VStack(spacing: 12) {
                ForEach(trips) { trip in
                    NavigationLink(
                        destination: ActivityView(trip: trip)
                    ) {
                        TripItemView(trip: trip)
                    }
                }
                SeeAllTripsView()
            }
            .padding(.top)
        }
        .groupBoxStyle(HistoryGroupBoxStyle(color: .red))
    }
}

private struct TripItemView: View {
    @State var trip: Activity

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Leading {
                // TODO:
                Text("Yesterday")
                    .font(.system(size: 17, weight: .medium, design: .default))
                    .foregroundColor(.primary)
            }

            Leading {
                Text(trip.tripName)
                    .font(.system(size: 15, weight: .regular, design: .default))
                    .foregroundColor(.secondary)
            }

            HStack(spacing: 20) {
                HStack {
                    Image(systemName: "ruler")
                        .foregroundColor(.secondary)
                    Text(trip.distance.format(precision: 1) + " Km")
                        .font(.system(size: 15, weight: .regular, design: .default))
                        .foregroundColor(.secondary)

                }
                HStack {
                    // TODO:
                    Image(systemName: "clock")
                        .foregroundColor(.secondary)
                    Text("0:25")
                        .font(.system(size: 15, weight: .regular, design: .default))
                        .foregroundColor(.secondary)

                }
            }
            .padding(.top, 10)
        }
        .padding(.horizontal, 25)
        .padding(.vertical, 15)
        .background(Color(hex: "fef2ec"))
        .cornerRadius(5)
    }
}

private struct SeeAllTripsView: View {

    var body: some View {
        
        NavigationLink(
            destination: Text("History"),
            label: {
                HStack(alignment: .center) {
                    Text("View Full History")
                        .font(.system(size: 17, weight: .regular, design: .default))
                        .foregroundColor(.black)
                    Spacer()
                    Image(systemName: "chevron.right")
                }
            })
            .padding(.horizontal, 25)
            .padding(.vertical, 20)
        .overlay(
            RoundedRectangle(cornerRadius: 5)
                .stroke(Color.gray.opacity(0.4), lineWidth: 1)
        )
    }
}

private struct HistoryGroupBoxStyle: GroupBoxStyle {
    var color: Color

    @ScaledMetric var size: CGFloat = 1

    func makeBody(configuration: Configuration) -> some View {
        GroupBox(label:
            HStack {
                configuration.label
                    .foregroundColor(color)
                Spacer(minLength: 0)
            }
        ) {
            configuration.content
        }
    }
}

struct InsightHistory_Previews: PreviewProvider {
    static var previews: some View {
        let trips: Trips = [
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

        InsightHistory(trips: trips)
            .preferredColorScheme(.light)

        TripItemView(trip: trips[0])
            .previewLayout(.sizeThatFits)
        
        SeeAllTripsView()
            .previewLayout(.sizeThatFits)

    }
}
