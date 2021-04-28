//
//  BikeTypeBarView.swift

import SwiftUI

public struct BikeTypeBarView: View {
    @Binding var selected : Int
    public let index: Int
    public let item: BottomBarItem
    
    public var body: some View {
        HStack {
            item.icon
                .imageScale(.medium)
                .foregroundColor(isSelected ? item.color : .primary)
                .frame(maxHeight: 15)
            
            if isSelected {
                Text(item.title)
                    .foregroundColor(item.color)
                    .font(.caption)
                    .fontWeight(.bold)
            }
        }
        .padding()
        .background(
            Capsule()
                .fill(item.color.opacity(0.2))
        )

    }
    
    var isSelected : Bool{
        selected == index
    }
    
}
