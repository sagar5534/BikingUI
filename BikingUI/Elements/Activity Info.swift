//
//  Activity Info.swift
//  BikingUI
//
//  Created by Sagar on 2020-09-21.
//

import SwiftUI

struct Activity_Info: View {
    // Data Incomplete
    @State var title: String = ""

    var body: some View {
        ScrollView {
            Leading {
                VStack(alignment: .leading) {
                    TextField("Trip Name", text: $title)
                        .font(.system(size: 35, weight: .bold, design: .default))
                        .foregroundColor(.primary)

                    Text("Sept 05, 2020")
                        .bold()
                        .font(.callout)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                }
                .padding(.leading)
                .padding(.top)
            }

            ScoreBoardDetail(totalKm: .constant("45.98"), movingTime: .constant("56"), avgPace: .constant("40:34"), fastestPace: .constant("34"))

            Divider()

            // Make map for this page
            Map()
                .frame(minHeight: 400)
                .padding()
        }
    }
}

struct Activity_Info_Previews: PreviewProvider {
    static var previews: some View {
        Activity_Info()
    }
}
