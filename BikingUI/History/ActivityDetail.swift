//
//  ActivityDetail.swift
//  BikingUI
//
//  Created by Sagar on 2020-09-21.
//

import SwiftUI
import SwiftUICharts

struct ActivityDetail: View {
    var body: some View {
        NavigationView {
            Activity_Info()

                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ActivityDetail_Previews: PreviewProvider {
    static var previews: some View {
        ActivityDetail()
    }
}
