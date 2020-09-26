//
//  HistoryCell.swift
//  BikingUI
//
//  Created by Sagar on 2020-09-23.
//

import SwiftUI
import MapKit

struct ActivityCell: View {
    @EnvironmentObject var firebaseManager: FirebaseManager
    @State var activity: Activity

    var body: some View {
        HStack(spacing: 15) {
            
            let x: [CLLocationCoordinate2D] = activity.coordinates.map{ $0.toCLLocationCoordinate() }
            Map_Summary(coordinates: .constant(x))
                .frame(width: 80, height: 80, alignment: .center)

            VStack(alignment: .leading, spacing: 5) {
                MainLabel(label: activity.tripName)

                HStack(alignment: .center) {
                    DetailLabel(label: activity.date.format())
                    Spacer()

                    let label = firebaseManager.user.isKm ? "Km" : "Mi"
                    let distance = activity.distance.formatDistance(isKm: firebaseManager.user.isKm).format()

                    DetailLabel(label: "\(distance) \(label)")

                    Spacer()
                    DetailLabel(label: activity.movingTime.toTime(pad: false))
                }
                .padding(.trailing)
            }

        }.padding(10)
    }
}

private struct DetailLabel: View {
    @State var label: String
    var body: some View {
        Text(label)
            .font(.callout)
            .foregroundColor(.secondary)
    }
}

private struct MainLabel: View {
    @State var label: String
    var body: some View {
        Text(label)
            .font(.system(size: 20, weight: .heavy))
            .foregroundColor(.primary)
            .italic()
    }
}

struct ActivityCell_Previews: PreviewProvider {
    static var previews: some View {
        List {
            NavigationLink(
                destination: Text("Destination"),
                label: {
                    ActivityCell(activity: Activity())
                }
            )
        }
    }
}
