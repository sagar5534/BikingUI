//
//  MapView.swift
//  BikingUI
//
//  Created by Sagar Patel on 2020-09-14.
//

import MapKit
import SwiftUI
import UIKit

public struct MapView<Content: View>: View {
    let content: () -> Content
    @Environment(\.colorScheme) var colorScheme
    
    public init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }

    public var body: some View {
        let color = colorScheme == .dark ? Color.black : Color.white
        
        GeometryReader { geometry in
            ZStack(alignment: Alignment(horizontal: .center, vertical: .center)) {
                self.content()
                Rectangle()
                    .foregroundColor(.clear)
                    
                    .background(RadialGradient(gradient: Gradient(colors: [color.opacity(0), color.opacity(1)]), center: .center, startRadius: 150, endRadius: geometry.size.height / 2))
            }
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView {
            Map()
        }
        .preferredColorScheme(.dark)
    }
}
