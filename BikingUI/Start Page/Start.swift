//
//  Start.swift
//  BikingUI
//
//  Created by Sagar Patel on 2020-09-14.
//

import SwiftUI
import UIKit

struct Start: View {
    
    @StateObject var model = Start_VModel.sharedInstance
    
    var body: some View {
        
        VStack {
            
            HStack {
                GroupBox(label: Label("Streaks", systemImage: "flame.fill")) {
                    InfoTextView(value: "4", unit: "Days")
                }
                .groupBoxStyle(InfoCardGroupBox(color: Color(red: 254 / 255, green: 87 / 255, blue: 45 / 255, opacity: 1)))
                .background(Color(UIColor.systemBackground))
                .cornerRadius(10)
                .shadow(color: Color.darkTextColorMain.opacity(0.1), radius: 5,x: 0,y: 0)

                
                GroupBox(label: Label("Travelled", systemImage: "mappin.and.ellipse")) {
                    InfoTextView(value: "4019", unit: "Kms")
                }
                .groupBoxStyle(InfoCardGroupBox(color: .blue))
                .background(Color(UIColor.systemBackground))
                .cornerRadius(10)
                .shadow(color: Color.darkTextColorMain.opacity(0.1), radius: 5,x: 0,y: 0)
                
            }
            .padding(.horizontal)
            .padding(.top)
            
            StartTripBox()
                .padding(.horizontal)

            Spacer()

        }
        .navigationTitle("Home")        
    }
    
}

struct InfoTextView: View {
    var value: String
    var unit: String
    
    @ScaledMetric var size: CGFloat = 1
    
    @ViewBuilder
    var body: some View {
        HStack {
            Text(value).font(.system(size: 24 * size, weight: .bold, design: .rounded)) +
                Text(" \(unit)").font(.system(size: 14 * size, weight: .semibold, design: .rounded)).foregroundColor(.secondary)
            Spacer()
        }
    }
}

struct InfoCardGroupBox: GroupBoxStyle {
    var color: Color
    
    @ScaledMetric var size: CGFloat = 1
    
    func makeBody(configuration: Configuration) -> some View {
        GroupBox(label: HStack {
            configuration.label
                .foregroundColor(color)
                .scaledToFit()
                .minimumScaleFactor(0.5)
                .lineLimit(2)
                
            Spacer()
        }) {
            configuration.content.padding(.top)
        }
    }
}


struct Start_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            Start()
                .previewDevice("iPhone 11 Pro")
        }
    }
}
