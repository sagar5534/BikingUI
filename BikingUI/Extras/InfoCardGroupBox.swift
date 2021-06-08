//
//  InfoCardGroupBox.swift
//  BikingUI
//
//  Created by Sagar on 2021-06-02.
//

import SwiftUI

struct InfoCardGroupBox: GroupBoxStyle {
    var color: Color

    @ScaledMetric var size: CGFloat = 1

    func makeBody(configuration: Configuration) -> some View {
        GroupBox(label: HStack {
            configuration.label
                .foregroundColor(color)
            Spacer()
        }) {
            configuration.content
                .padding(.top)
        }
    }
}

struct InfoCardGroupBox_Previews: PreviewProvider {
    static var previews: some View {
        GroupBox(label: Label("Trip Name", systemImage: "mappin.and.ellipse")) {
            VStack(alignment: .leading, spacing: 3) {
                Text("Testing")
            }
        }
        .groupBoxStyle(InfoCardGroupBox(color: .blue))
    }
}
