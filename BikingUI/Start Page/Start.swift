//
//  Start.swift
//  BikingUI
//
//  Created by Sagar Patel on 2020-09-14.
//

import SwiftUI
import UIKit

struct Start: View {
    @State private var isTrackingMode = false
        
    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    MapView {
                        Map()
                    }

                    VStack {
                        Spacer()

                        Button(action: {
                            self.isTrackingMode.toggle()
                        }, label: {
                            ZStack {
                                Circle()
                                    .shadow(radius: 3)
                                Text("START")
                                    .font(.system(size: 22, weight: .heavy))
                                    .foregroundColor(Color.white)
                                    .italic()
                            }
                            .frame(width: 125, height: 125, alignment: .center)
                        })
                    }
                    .padding(.bottom, 30)
                }
            }
            .navigationTitle("Start a Ride")
        }
        .fullScreenCover(isPresented: $isTrackingMode, content: DashTabManager.init)
        
    }
}

struct Start_Previews: PreviewProvider {
    static var previews: some View {
        Start()
            .previewDevice("iPhone 11 Pro")
    }
}
