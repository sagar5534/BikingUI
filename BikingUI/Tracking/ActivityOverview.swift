////
////  ActivityOverview.swift
////  BikingUI
////
////  Created by Sagar on 2020-09-21.
////
//
// import SwiftUI
//
// struct ActivityOverview: View {
//    @Environment(\.presentationMode) var presentationMode
//
//    @State var activity: Activity
//
//    var body: some View {
//        NavigationView {
//            Activity_Info(activity: activity, isConfirmView: true)
//                .navigationBarTitleDisplayMode(.inline)
//                .navigationBarItems(trailing: Button(action: {
//
//                    if activity.tripName.isEmpty {
//                        activity.tripName = "Afternoon Trip"
//                    }
//
//                    firebaseManager.addActivity(activity: activity)
//                    presentationMode.wrappedValue.dismiss()
//                }, label: {
//                    Text("Done")
//                }))
//        }
//    }
// }
//
// struct ActivityOverview_Previews: PreviewProvider {
//    static var previews: some View {
//
//        ActivityOverview(activity: Activity())
//
//    }
// }
