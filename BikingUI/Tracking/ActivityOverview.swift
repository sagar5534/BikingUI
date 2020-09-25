//
//  ActivityOverview.swift
//  BikingUI
//
//  Created by Sagar on 2020-09-21.
//

import SwiftUI

struct ActivityOverview: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var Location: CoreLocation
    
    @State var newActivity = Activity()
    
    var body: some View {
        NavigationView {
            Activity_Info(activity: newActivity, isConfirmView: true)

                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(trailing: Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Text("Save")
                }))
        }
        .onAppear{
            newActivity = Activity(location: Location)
        }
    }
}

struct ActivityOverview_Previews: PreviewProvider {
    static var previews: some View {
        ActivityOverview()
    }
}
