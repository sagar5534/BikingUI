//
//  History.swift
//  BikingUI
//
//  Created by Sagar on 2020-09-16.
//

import SwiftUI

struct Insights: View {
    @State var trips: [Trip] = [
        Trip(id: 1, name: "Sagar"),
        Trip(id: 2, name: "Om"),
    ]

    var body: some View {
        VStack {
            InsightScoreboard()
                .padding(.horizontal)
                .padding(.top)
                .boxShadow()

            InsightHistory(trips: trips)
                .padding(.horizontal)
                .boxShadow()

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
