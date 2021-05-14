//
//  InsightHistory.swift
//  BikingUI
//
//  Created by Sagar on 2021-05-08.
//

import SwiftUI

struct Trip: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var date: Date
    var distance: Double
    var time: Double
    var pace: Double

//    private var coordinates: Coordinates
//    var locationCoordinate: CLLocationCoordinate2D {
//        CLLocationCoordinate2D(
//            latitude: coordinates.latitude,
//            longitude: coordinates.longitude)
//    }
//
//    struct Coordinates: Hashable, Codable {
//        var latitude: Double
//        var longitude: Double
//    }
}

struct InsightHistory: View {
    @State var trips: [Trip]

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
                    NavigationLink(destination: Text(trip.name)) {
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
    @State var trip: Trip

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Leading {
                //TODO
                Text("Yesterday")
                    .font(.system(size: 24, weight: .bold, design: .rounded))
                    .foregroundColor(.black)
            }

            Leading {
                Text(trip.name)
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
                    Text(trip.time.toTime(pad: true,units: [NSCalendar.Unit.minute, NSCalendar.Unit.hour]))
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
        let trips: [Trip] = [
            Trip(id: 1, name: "Sagar", date: Date(), distance: 10, time: 50000, pace: 0.25),
            Trip(id: 2, name: "Om", date: Date(), distance: 15, time: 7000, pace: 1.25),
        ]

        InsightHistory(trips: trips)
            .preferredColorScheme(.light)

        TripItemView(trip: trips[0])
            .previewLayout(.sizeThatFits)
    }
}
