//
//  Start_BikeType.swift
//  BikingUI
//
//  Created by Sagar Patel on 2020-09-15.
//

import SwiftUI

struct Start_BikeType: View {
    @Binding var isDistance: Bool

    var body: some View {
        Leading {
            HStack(spacing: 25) {
                Button(action: {
                    isDistance = true
                }, label: {
                    Text("Distance")
                        .font(.callout)
                        .fontWeight(isDistance ? .bold : .none)
                        .foregroundColor(.primary)
                })

                Button(action: {
                    isDistance = false
                }, label: {
                    Text("Time")
                        .font(.callout)
                        .fontWeight(isDistance ? .none : .bold)
                        .foregroundColor(.primary)

                })
            }
        }
    }
}

struct Start_BikeType_Previews: PreviewProvider {
    static var previews: some View {
        Start_BikeType(isDistance: .constant(true))
    }
}
