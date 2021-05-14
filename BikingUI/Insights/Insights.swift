//
//  History.swift
//  BikingUI
//
//  Created by Sagar on 2020-09-16.
//

import SwiftUI

struct Insights: View {
    @State var trips: [Trip] = [
        Trip(id: 1, name: "Sagar", date: Date(), distance: 10, time: 5.15, pace: 0.25),
        Trip(id: 2, name: "Om", date: Date(), distance: 15, time: 6.15, pace: 1.25),
    ]

    var body: some View {
        VStack {
            InsightScoreboard()
                .boxShadow()
                .padding(.horizontal)
                .padding(.top)

            InsightHistory(trips: trips)
                .boxShadow()
                .padding(.horizontal)

            Spacer()
        }
        .navigationTitle("Insights")
    }
}

struct History_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Insights()
        }
    }
}
