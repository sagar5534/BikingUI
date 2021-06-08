//
//  StartTripBox.swift
//  BikingUI
//
//  Created by Sagar on 2021-04-26.
//

import SwiftUI

struct StartTripBox: View {
    let items: [BottomBarItem] = [
        BottomBarItem(icon: "clock.fill", title: "Timed", color: .purple),
        BottomBarItem(icon: "ruler", title: "Distance", color: .pink),
        BottomBarItem(icon: "timer", title: "Pace", color: .orange),
    ]
    @State public var selectedIndex: Int = 4

    @State var timer = TimeInterval()
    @State private var seconds: TimeInterval = 60 * 60 * 12

    static let formatter: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute]
        return formatter
    }()

    var body: some View {
        ZStack {
            Image("lightmap")
                .resizable()
                .opacity(0.1)
                .blur(radius: 0.1, opaque: true)

            VStack {
                Leading {
                    Text("Start a Trip")
                        .font(.system(size: 30, weight: .bold, design: .default))
                }
                .padding(.horizontal)
                .padding(.top)

                HStack(alignment: .center) {
                    ForEach(0 ..< items.count) { index in

                        Button(action: {
                            withAnimation { self.selectedIndex = index }
                        }) {
                            BikeTypeBarView(selected: self.$selectedIndex,
                                            index: index,
                                            item: items[index])
                        }
                    }
                    Spacer()
                }
                .padding(.horizontal)

                Spacer()

                Button(action: {}, label: {
                    Leading {
                        Spacer()
                        Text("Start")
                            .font(.system(size: 22, weight: .semibold))
                            .foregroundColor(.blue)
                        Image(systemName: "arrow.forward")
                            .resizable()
                            .frame(width: 15, height: 12, alignment: .center)
                            .font(.system(size: 23, weight: .medium))
                            .foregroundColor(.blue)
                    }
                })
                    .padding()
            }
        }
    }
}

private struct DurationPicker: UIViewRepresentable {
    @Binding var duration: TimeInterval

    func makeUIView(context: Context) -> UIDatePicker {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .countDownTimer
        datePicker.addTarget(context.coordinator, action: #selector(Coordinator.updateDuration), for: .valueChanged)
        return datePicker
    }

    func updateUIView(_ datePicker: UIDatePicker, context _: Context) {
        datePicker.countDownDuration = duration
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject {
        let parent: DurationPicker

        init(_ parent: DurationPicker) {
            self.parent = parent
        }

        @objc func updateDuration(datePicker: UIDatePicker) {
            parent.duration = datePicker.countDownDuration
        }
    }
}

private struct BikeTypeBarView: View {
    @Binding var selected: Int
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

    var isSelected: Bool {
        selected == index
    }
}

struct StartTripBox_Previews: PreviewProvider {
    static var previews: some View {
        Start()
    }
}
