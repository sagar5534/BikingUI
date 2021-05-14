//
//  InsightHistory.swift
//  BikingUI
//
//  Created by Sagar on 2021-05-08.
//

import SwiftUI

struct InsightHistory: View {
    @State var trips: Trips

    var body: some View {
        GroupBox(label:

            HStack {
                Text("Recent Trips")
                Spacer()
                NavigationLink(
                    destination: Text("Destination"),
                    label: {
                        Text("See All")
                            .foregroundColor(.blue)
                    })
            }

        ) {
            VStack {
                ForEach(trips) { trip in
                    NavigationLink(destination: Text(trip.tripName)) {
                        TripItemView(trip: trip)
                    }
                    Divider()
                }
            }
            .padding(.top, 5)
        }
        .groupBoxStyle(HistoryGroupBoxStyle(color: .red))
    }
}

private struct TripItemView: View {
    @State var trip: Activity

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Leading {
                //TODO
                Text("Yesterday")
                    .font(.system(size: 24, weight: .bold, design: .rounded))
                    .foregroundColor(.black)
            }

            Leading {
                Text(trip.tripName)
                    .font(.system(size: 18, weight: .semibold, design: .rounded))
                    .foregroundColor(.gray)
            }

            HStack(spacing: 20) {
                HStack {
                    Image(systemName: "ruler")
                    Text(trip.distance.format(precision: 1) + " Km")
                        .font(.system(size: 16, weight: .semibold, design: .rounded))
                }
                HStack {
                    Image(systemName: "timer")
                    Text(trip.movingTime.toTime(pad: true,units: [NSCalendar.Unit.minute, NSCalendar.Unit.hour]))
                        .font(.system(size: 16, weight: .semibold, design: .rounded))
                }
                
                HStack {
                    //TODO
                    Image(systemName: "clock")
                    Text("0:25")
                        .font(.system(size: 16, weight: .semibold, design: .rounded))
                }
            }
            .padding(.top)
        }
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
            Activity(tripName: "Monday Afternoon", distance: 10.55, movingTime: 1000, totalTime: 1200, avgSpeed: 20.3, fastestSpeed: 70.0),
            Activity(tripName: "Sunday Afternoon", distance: 12.55, movingTime: 2000, totalTime: 2500, avgSpeed: 17.1, fastestSpeed: 30)
        ]

        InsightHistory(trips: trips)
            .preferredColorScheme(.light)

        TripItemView(trip: trips[0])
            .previewLayout(.sizeThatFits)
    }
}
