//
//  History.swift
//  BikingUI
//
//  Created by Sagar on 2020-09-16.
//

import SwiftUI

struct History: View {

    var body: some View {
        NavigationView {
            ScrollView {
                ScoreBoard(totalKm: .constant("45.98"), totalTrips: .constant("56"), totalMoving: .constant("40:34"), totalLast: .constant("34"))

                Divider()
            }
            .navigationTitle("History")
            .navigationBarItems(leading:
                Image("profile").resizable()
                    .frame(width: 40, height: 40, alignment: .center)
                    .clipShape(Circle())
                    .overlay(
                        Circle().stroke(Color.white, lineWidth: 3))
                    .shadow(radius: 3)
                    .padding(.bottom)
            )
        }
    }
}

struct History_Previews: PreviewProvider {
    static var previews: some View {
        History()
            .previewDevice("iPhone 11 Pro")
    }
}
