//
//  ScoreBoard.swift
//  BikingUI
//
//  Created by Sagar on 2020-09-16.
//

import SwiftUI

struct ScoreBoard: View {
    @EnvironmentObject var firebaseManager: FirebaseManager

    var body: some View {
        VStack {
            VStack {
                Text(firebaseManager.user.distance.formatDistance(isKm: firebaseManager.user.isKm).format())
                    .font(.system(size: 55, weight: .heavy))
                    .foregroundColor(.primary)
                    .italic()
                Text(firebaseManager.user.isKm ? "Kilometers" : "Miles")
                    .font(.callout)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
            }
            .padding()

            HStack(alignment: .top) {
                VStack {
                    Text(String(firebaseManager.user.trips))
                        .font(.system(size: 20, weight: .heavy))
                        .foregroundColor(.primary)
                        .italic()
                    Text("Trips")
                        .font(.callout)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                }
                .frame(maxWidth: .infinity)

                Divider()

                VStack {
                    Text(String(firebaseManager.user.movingTime.toTime(pad: false)))
                        .font(.system(size: 20, weight: .heavy))
                        .foregroundColor(.primary)
                        .italic()
                    Text("Time")
                        .font(.callout)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                }
                .frame(maxWidth: .infinity)

                Divider()

                VStack {
                    Text(firebaseManager.user.avgSpeed.formatSpeed(isKmph: firebaseManager.user.isKm).format())
                        .font(.system(size: 20, weight: .heavy))
                        .foregroundColor(.primary)
                        .italic()
                    Text("Avg Speed")
                        .font(.callout)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                }
                .frame(maxWidth: .infinity)
            }
            .padding()

            .padding(.leading)
            .padding(.trailing)
            .padding(.bottom)
        }
    }
}

struct ScoreBoardDetail: View {
    @EnvironmentObject var firebaseManager: FirebaseManager
    @State var activity: Activity

    var body: some View {
        VStack {
            VStack {
                let label = firebaseManager.user.isKm ? "Kilometers" : "Miles"
                let distance = activity.distance.formatDistance(isKm: firebaseManager.user.isKm).format()

                Text(distance)
                    .font(.system(size: 55, weight: .heavy))
                    .foregroundColor(.primary)
                    .italic()
                Text(label)
                    .font(.callout)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
            }
            .padding()

            VStack {
                HStack(alignment: .top) {
                    let avg = activity.avgSpeed.formatSpeed(isKmph: firebaseManager.user.isKm).format()
                    let fast = activity.fastestSpeed.formatSpeed(isKmph: firebaseManager.user.isKm).format()

                    MinorLabel(value: avg, detail: "Avg Speed")
                    Divider()
                    MinorLabel(value: fast, detail: "Fastest Speed")
                }
                .padding()

                HStack(alignment: .top) {
                    MinorLabel(value: activity.movingTime.toTime(pad: false), detail: "Moving Time")
                    Divider()
                    MinorLabel(value: activity.totalTime.toTime(pad: false), detail: "Total Time")
                }
                .padding()
            }
            .padding(.leading)
            .padding(.trailing)
            .padding(.bottom)
        }
    }
}

private struct MinorLabel: View {
    @State var value: String
    @State var detail: String = ""

    var body: some View {
        VStack {
            Text(String(value))
                .font(.system(size: 20, weight: .heavy))
                .foregroundColor(.primary)
                .italic()
            Text(detail)
                .font(.callout)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity)
    }
}

struct ScoreBoard_Previews: PreviewProvider {
    static var previews: some View {
        var fire = FirebaseManager()

        ScoreBoard()
            .previewLayout(.fixed(width: 400, height: 250))
            .environmentObject(fire)
            .onAppear {
                fire.fetchData()
            }

        ScoreBoardDetail(activity: Activity())
            .previewLayout(.fixed(width: 400, height: 250))
    }
}
