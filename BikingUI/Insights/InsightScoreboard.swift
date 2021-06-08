//
//  InsightScoreboard.swift
//  BikingUI
//
//  Created by Sagar on 2021-04-27.
//

import SwiftUI

struct InsightScoreboard: View {
    var body: some View {
        HStack(alignment: .top, spacing: nil) {
            ContentBox(label: "Trips") {
                VStack {
                    Spacer(minLength: 0)
                    InfoLabel(value: "4", unit: "trips")
                }
            }
            .padding(.vertical)

            Divider()
                .padding(.vertical)
                .padding(.horizontal)

            ContentBox(label: "Avg Speed") {
                VStack {
                    Spacer(minLength: 0)
                    InfoLabel(value: "40", unit: "km/h")
                }
            }
            .padding(.vertical)

            Divider()
                .padding(.vertical)
                .padding(.horizontal)

            ContentBox(label: "Avg Distance") {
                VStack {
                    Spacer(minLength: 0)
                    InfoLabel(value: "10", unit: "km")
                }
            }
            .padding(.vertical)
        }
        .fixedSize(horizontal: false, vertical: true)
        .padding(.horizontal)
        .background(Color("ScoreCardColor"))
        .overlay(
            RoundedRectangle(cornerRadius: 5)
                .stroke(Color("ScoreCardBorder").opacity(0.3), lineWidth: 1)
        )
    }
}

private struct InfoLabel: View {
    var value: String
    var unit: String

    @ViewBuilder
    var body: some View {
        HStack(alignment: .firstTextBaseline, spacing: 0) {
            Spacer(minLength: 0)

            Text(value)
                .font(.system(size: 24, weight: .bold, design: .default))
            Text(" \(unit)")
                .font(.system(size: 15, weight: .regular, design: .default))
                .foregroundColor(.secondary)

            Spacer(minLength: 0)
        }
    }
}

struct InsightScoreboard_Previews: PreviewProvider {
    static var previews: some View {
        InsightScoreboard()
            .preferredColorScheme(.dark)
    }
}
