//
//  MapView.swift
//  BikingUI
//
//  Created by Sagar Patel on 2020-09-14.
//

import MapKit
import SwiftUI
import UIKit

struct MapView: View {
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: Alignment(horizontal: .center, vertical: .center)) {
                Map()
                Rectangle()
                    .foregroundColor(.clear)
                    .background(RadialGradient(gradient: Gradient(colors: [Color.white.opacity(0), Color.white.opacity(1)]), center: .center, startRadius: 150, endRadius: geometry.size.height / 2))
            }
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
            .previewDevice("iPhone 11 Pro")
    }
}

