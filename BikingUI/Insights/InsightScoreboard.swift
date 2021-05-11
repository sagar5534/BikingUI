//
//  InsightScoreboard.swift
//  BikingUI
//
//  Created by Sagar on 2021-04-27.
//

import SwiftUI

struct InsightScoreboard: View {
    var body: some View {
        
        VStack{
            HStack(alignment: .top, spacing: nil){
                GroupBox(label: Text("Trips")) {
                    VStack{
                        Spacer(minLength: 0)
                        InfoLabel(value: "4", unit: "trips")
                    }
                }
                .groupBoxStyle(InsightsGroupBoxStyle(color: .red))

                Divider()
                    .padding(.vertical)

                GroupBox(label: Text("Avg\nSpeed")) {
                    VStack{
                        Spacer(minLength: 0)
                        InfoLabel(value: "40", unit: "km/h")
                    }

                }
                .groupBoxStyle(InsightsGroupBoxStyle(color: .blue))

                Divider()
                    .padding(.vertical)

                GroupBox(label: Text("Avg\nDistance")) {
                    VStack{
                        Spacer(minLength: 0)
                        InfoLabel(value: "10", unit: "km")
                    }
                }
                .groupBoxStyle(InsightsGroupBoxStyle(color: .blue))
            }
            .fixedSize(horizontal: false, vertical: true)
        }
        .background(Color(UIColor.systemBackground))
        .cornerRadius(10)
        .shadow(color: Color.darkTextColorMain.opacity(0.1), radius: 5,x: 0,y: 0)
        
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
    
    @ScaledMetric var size: CGFloat = 1
    
    @ViewBuilder
    var body: some View {
        HStack(alignment: .firstTextBaseline, spacing: 0) {
            Spacer(minLength: 0)
            Text(value)
                .font(.system(size: 24 * size, weight: .bold, design: .rounded))
            
            Text(" \(unit)")
                .font(.system(size: 14 * size, weight: .semibold, design: .rounded))
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
