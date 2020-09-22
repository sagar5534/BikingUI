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
                    MapView()

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
            .navigationBarItems(leading:
                Image("profile").resizable()
                    .frame(width: 40, height: 40, alignment: .center)
                    .clipShape(Circle())
                    .overlay(
                        Circle().stroke(Color.white, lineWidth: 3))
                    .shadow(radius: 3)
                    .foregroundColor(Color.red)
                    .padding(.bottom)
            )
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
