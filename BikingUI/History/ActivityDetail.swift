//
//  ActivityDetail.swift
//  BikingUI
//
//  Created by Sagar on 2020-09-21.
//

import SwiftUI
import SwiftUICharts

struct ActivityDetail: View {
    
    @State var activity: User
    
    var body: some View {
        Activity_Info(activity: activity)
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct ActivityDetail_Previews: PreviewProvider {
    static var previews: some View {
        ActivityDetail(activity: User(name: "", distance: 0, movingTime: 0, trips: 0, avgSpeed: 0, activity: []))
    }
}
