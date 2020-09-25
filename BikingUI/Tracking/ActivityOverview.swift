//
//  ActivityOverview.swift
//  BikingUI
//
//  Created by Sagar on 2020-09-21.
//

import SwiftUI

struct ActivityOverview: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var firebaseManager: FirebaseManager

    @State var activity: Activity

    var body: some View {
        NavigationView {
            Activity_Info(activity: activity, isConfirmView: true)
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(trailing: Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Text("Save")
                }))
        }
    }
}

struct ActivityOverview_Previews: PreviewProvider {
    static var previews: some View {
        var fire = FirebaseManager()

        ActivityOverview(activity: Activity())
            .environmentObject(fire)
            .onAppear {
                fire.fetchData()
            }
    }
}
