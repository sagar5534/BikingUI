//
//  ContentBox.swift
//  BikingUI
//
//  Created by Sagar on 2021-06-07.
//

import SwiftUI

public struct ContentBox<Content: View>: View {
    let content: () -> Content
    let label: String

    public init(
        label: String,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.content = content
        self.label = label
    }

    public var body: some View {
        VStack {
            HStack {
                Text(label)
                    .font(.system(size: 17, weight: .bold, design: .default))
                    .foregroundColor(.primary)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                    .fixedSize(horizontal: false, vertical: true)

//                    .minimumScaleFactor(0.4)
                Spacer()
            }
            .padding(.bottom)
            self.content()
        }
    }
}

struct ContentBox_Previews: PreviewProvider {
    static var previews: some View {
        ContentBox(label: "Recent Trips") {
            Text("Hey")
        }
    }
}
