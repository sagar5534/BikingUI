//
//  BottomBar.swift
//  BottomBar
//
//  Created by Bezhan Odinaev on 7/2/19.
//  Copyright © 2019 Bezhan Odinaev. All rights reserved.
//

import SwiftUI
import UIKit

public struct BottomBar: View {
    @Binding public var selectedIndex: Int

    public let items: [BottomBarItem]

    public init(selectedIndex: Binding<Int>, items: [BottomBarItem]) {
        _selectedIndex = selectedIndex
        self.items = items
    }

    public init(selectedIndex: Binding<Int>, @BarBuilder items: () -> [BottomBarItem]) {
        self = BottomBar(selectedIndex: selectedIndex,
                         items: items())
    }

    public init(selectedIndex: Binding<Int>, item: BottomBarItem) {
        self = BottomBar(selectedIndex: selectedIndex,
                         items: [item])
    }

    func itemView(at index: Int) -> some View {
        Button(action: {
            withAnimation { self.selectedIndex = index }
        }) {
            BottomBarItemView(selected: self.$selectedIndex,
                              index: index,
                              item: items[index])
        }
    }

    public var body: some View {
        ZStack {
            VisualEffectBlur(blurStyle: .regular)
                .cornerRadius(40)
                .shadow(color: Color.darkTextColorMain.opacity(0.1), radius: 10, x: 10, y: 5)

            HStack(alignment: .center) {
                ForEach(0 ..< items.count) { index in
                    self.itemView(at: index)

                    if index != self.items.count - 1 {
                        Spacer()
                    }
                }
            }
            .animation(.default)
            .padding(EdgeInsets(top: 0, leading: 40, bottom: 0, trailing: 40))
        }.fixedSize()
    }
}

#if DEBUG
    struct BottomBar_Previews: PreviewProvider {
        static var previews: some View {
            BottomBar(selectedIndex: .constant(0), items: [
                BottomBarItem(icon: "house.fill", title: "Home", color: .purple),
                BottomBarItem(icon: "heart", title: "Likes", color: .pink),
                BottomBarItem(icon: "magnifyingglass", title: "Search", color: .orange),
                BottomBarItem(icon: "person.fill", title: "Profile", color: .blue),
            ])
        }
    }
#endif

@available(iOS 13.0, *)
public extension Color {
    static var random: Color {
        return Color(red: .random(in: 0 ... 1),
                     green: .random(in: 0 ... 1),
                     blue: .random(in: 0 ... 1))
    }

    static let iconColor = Color.black.opacity(0.65)
    static let deselectedColor = Color.gray.opacity(0.8)
    static let backgroundColor = Color(red: 228 / 255,
                                       green: 228 / 255,
                                       blue: 229 / 255)
    static let darkTextColorMain = Color(red: 1 / 255,
                                         green: 0 / 255,
                                         blue: 25 / 255)
    static let dividerColor = Color(red: 200 / 255,
                                    green: 200 / 255,
                                    blue: 200 / 255).opacity(0.2)
}

@available(iOS 13.0, *)
struct BlurView: UIViewRepresentable {
    let style: UIBlurEffect.Style

    func makeUIView(context _: UIViewRepresentableContext<BlurView>) -> UIView {
        let view = UIView(frame: .zero)
        view.backgroundColor = .clear
        let blurEffect = UIBlurEffect(style: style)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.translatesAutoresizingMaskIntoConstraints = false
        view.insertSubview(blurView, at: 0)
        NSLayoutConstraint.activate([
            blurView.heightAnchor.constraint(equalTo: view.heightAnchor),
            blurView.widthAnchor.constraint(equalTo: view.widthAnchor),
        ])
        return view
    }

    func updateUIView(_: UIView,
                      context _: UIViewRepresentableContext<BlurView>) {}
}
