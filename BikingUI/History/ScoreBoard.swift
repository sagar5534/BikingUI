//
//  ScoreBoard.swift
//  BikingUI
//
//  Created by Sagar on 2020-09-16.
//

import SwiftUI

struct ScoreBoard: View {
    @Binding var totalKm: String
    @Binding var totalTrips: String
    @Binding var totalMoving: String
    @Binding var totalLast: String

    var body: some View {
        VStack {
            VStack {
                Text(totalKm)
                    .font(.system(size: 55, weight: .heavy))
                    .foregroundColor(Color.black)
                    .italic()
                Text("Total Kilometers")
                    .font(.callout)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
            }
            .padding()

            ZStack {
                RoundedRectangle(cornerRadius: 25.0, style: .circular)
                    .foregroundColor(.white)

                HStack(alignment: .top) {
                    MinorLabel(value: $totalTrips, detail: "Total Trips")
                    Divider()
                    MinorLabel(value: $totalMoving, detail: "Total Moving Time")
                    Divider()
                    MinorLabel(value: $totalLast, detail: "Total Last")
                }
                .padding()
            }
            .padding(.leading)
            .padding(.trailing)
            .padding(.bottom)
        }
    }
}

struct ScoreBoardDetail: View {
    @Binding var totalKm: String
    @Binding var movingTime: String
    @Binding var avgPace: String
    @Binding var fastestPace: String

    var body: some View {
        VStack {
            VStack {
                Text(totalKm)
                    .font(.system(size: 55, weight: .heavy))
                    .foregroundColor(Color.black)
                    .italic()
                Text("Kilometers")
                    .font(.callout)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
            }
            .padding()

            ZStack {
                RoundedRectangle(cornerRadius: 25.0, style: .circular)
                    .foregroundColor(.white)

                HStack(alignment: .top) {
                    MinorLabel(value: $movingTime, detail: "Moving Time")
                    Divider()
                    MinorLabel(value: $avgPace, detail: "Avg Pace")
                    Divider()
                    MinorLabel(value: $fastestPace, detail: "Fastest Pace")
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
    @Binding var value: String
    @State var detail: String = ""

    var body: some View {
        VStack {
            Text(value)
                .font(.system(size: 20, weight: .heavy))
                .foregroundColor(Color.black)
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
        ScoreBoard(totalKm: .constant("45.98"), totalTrips: .constant("56"), totalMoving: .constant("40:34"), totalLast: .constant("34"))
            .previewLayout(.fixed(width: 400, height: 250))

        ScoreBoardDetail(totalKm: .constant("45.98"), movingTime: .constant("56"), avgPace: .constant("40:34"), fastestPace: .constant("34"))
            .previewLayout(.fixed(width: 400, height: 250))
    }
}
