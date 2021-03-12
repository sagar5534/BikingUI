//
//  DashMap.swift
//  BikingUI
//
//  Created by Sagar on 2020-09-19.
//

import SwiftUI

struct Dashboard_Map: View {
    @Binding var selectedTabViewPage: Int
    @EnvironmentObject var Location: CoreLocation

    var body: some View {
        ZStack(alignment: .bottom) {

            Map_Tracking(coordinates: $Location.coordinates)

            Button(action: {
                withAnimation { selectedTabViewPage -= 1 }
            }, label: { 
                ZStack {
                    Circle()
                        .shadow(radius: 3)
                        .foregroundColor(.red)
                    Image(systemName: "arrow.left")
                        .foregroundColor(.white)
                        .font(.system(size: 30, weight: .bold))
                }
            })
                .frame(width: 100, height: 100, alignment: .center)
                .padding()
            
        }
        .ignoresSafeArea()
    }
}

struct DashMap_Previews: PreviewProvider {
    static var previews: some View {
        Dashboard_Map(selectedTabViewPage: .constant(2))
    }
}
