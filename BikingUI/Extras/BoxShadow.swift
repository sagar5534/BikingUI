//
//  BoxShadow.swift
//  BikingUI
//
//  Created by Sagar on 2021-05-10.
//

import SwiftUI

extension View {
    func boxShadow() -> some View {
        modifier(ShadowModifier())
    }
}

private struct ShadowModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(Color(UIColor.systemBackground))
            .cornerRadius(10)
            .shadow(color: Color.darkTextColorMain.opacity(0.1), radius: 5, x: 0, y: 0)
    }
}

// extension View {
//    func boxShadow() -> some View {
//        modifier(ShadowModifier())
//    }
// }
//
// private struct ShadowModifier: ViewModifier {
//    func body(content: Content) -> some View {
//        content
//            .background(Color(UIColor.systemBackground))
//            .cornerRadius(10)
//            .shadow(color: Color.darkTextColorMain.opacity(0.1), radius: 5, x: 0, y: 0)
//    }
// }
