//
//  History.swift
//  BikingUI
//
//  Created by Sagar on 2020-09-16.
//

import SwiftUI

struct History: View {
    @ObservedObject private var firebaseManager = FirebaseManager()

    private var lightColor = Color(UIColor(red: 0.97, green: 0.97, blue: 0.97, alpha: 1.00))
    private var whiteColor = Color(UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00))

    var body: some View {
        NavigationView {
            List {
                ScoreBoard(totalKm: .constant("45.98"), totalTrips: .constant("56"), totalMoving: .constant("40:34"), totalLast: .constant("34"))

                ForEach(self.firebaseManager.data) { activity in
                    NavigationLink(
                        destination: ActivityDetail(activity: activity),
                        label: {
                            ActivityCell(activity: activity)
                        })
                }
            }
            .listStyle(PlainListStyle())

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
            .onAppear {
                self.firebaseManager.fetchData()
            }
        }
    }
}

struct History_Previews: PreviewProvider {
    static var previews: some View {
        History()
            .previewDevice("iPhone 11 Pro")
    }
}
