//
//  History.swift
//  BikingUI
//
//  Created by Sagar on 2020-09-16.
//

import SwiftUI

struct History: View {
    
    @EnvironmentObject var firebaseManager: FirebaseManager

    var body: some View {
        NavigationView {
            List {
                ScoreBoard()

                ForEach(firebaseManager.activity) { activity in
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
        }
    }
}

struct History_Previews: PreviewProvider {
    
    static var previews: some View {
        
        var fire = FirebaseManager()
        
        History()
            .environmentObject(fire)
            .onAppear{fire.fetchData()}
        
    }
}
