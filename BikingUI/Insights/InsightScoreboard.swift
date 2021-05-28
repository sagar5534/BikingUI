//
//  InsightScoreboard.swift
//  BikingUI
//
//  Created by Sagar on 2021-04-27.
//

import SwiftUI

struct InsightScoreboard: View {
    var body: some View {
        VStack {
            HStack(alignment: .top, spacing: nil) {
                GroupBox(label: Text("Trips")) {
                    VStack {
                        Spacer(minLength: 0)
                        InfoLabel(value: "4", unit: "trips")
                    }
                }
                .groupBoxStyle(InsightsGroupBoxStyle(color: .orange))

                Divider()
                    .padding(.vertical)

                GroupBox(label: Text("Avg\nSpeed")) {
                    VStack {
                        Spacer(minLength: 0)
                        InfoLabel(value: "40", unit: "km/h")
                    }
                }
                .groupBoxStyle(InsightsGroupBoxStyle(color: .orange))

                Divider()
                    .padding(.vertical)

                GroupBox(label: Text("Avg\nDistance")) {
                    VStack {
                        Spacer(minLength: 0)
                        InfoLabel(value: "10", unit: "km")
                    }
                }
                .groupBoxStyle(InsightsGroupBoxStyle(color: .orange))
            }
            .fixedSize(horizontal: false, vertical: true)
        }
    }
}

private struct InsightsGroupBoxStyle: GroupBoxStyle {
    var color: Color

    @ScaledMetric var size: CGFloat = 1

    func makeBody(configuration: Configuration) -> some View {
        GroupBox(label:
            HStack {
                configuration.label
                    .foregroundColor(color)
                    .lineLimit(2)
                    .minimumScaleFactor(0.4)

                Spacer(minLength: 0)
            }
        ) {
            configuration.content
                .lineLimit(1)
                .minimumScaleFactor(0.4)
        }
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
//                .font(.system(size: 14, weight: .semibold, design: .default))
                .font(.system(size: 15, weight: .regular, design: .default))

                .foregroundColor(.secondary)
            Spacer(minLength: 0)
        }
    }
    
}

struct InsightScoreboard_Previews: PreviewProvider {
    static var previews: some View {
        InsightScoreboard()
    }
}
