//
//  History.swift
//  BikingUI
//
//  Created by Sagar on 2020-09-16.
//

import SwiftUI

struct History: View {
    @ObservedObject private var firebaseManager = FirebaseManager()

    var body: some View {
        NavigationView {
            List {
                ScoreBoard(User: $firebaseManager.data)

//                ForEach(self.firebaseManager.data) { activity in
//                    NavigationLink(
//                        destination: ActivityDetail(activity: activity),
//                        label: {
//                            ActivityCell(activity: activity)
//                        })
//                }
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
