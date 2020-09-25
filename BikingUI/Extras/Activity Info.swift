//
//  Activity Info.swift
//  BikingUI
//
//  Created by Sagar on 2020-09-21.
//

import SwiftUI

struct Activity_Info: View {

    @State var activity: Activity

    var body: some View {
        ScrollView {
            Leading {
                VStack(alignment: .leading) {
                    Text(activity.tripName)
                        .font(.system(size: 35, weight: .bold, design: .default))
                        .foregroundColor(.primary)

                    Text(activity.date.format())
                        .bold()
                        .font(.callout)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                }
                .padding(.leading)
                .padding(.top)
            }

            ScoreBoardDetail(activity: activity)

            Divider()

            // Make map for this page
            Map_Summary()
                .frame(minHeight: 400)
                .padding()
        }
    }
}

struct Activity_Info_Previews: PreviewProvider {
    static var previews: some View {
        Activity_Info(activity: Activity())
    }
}
