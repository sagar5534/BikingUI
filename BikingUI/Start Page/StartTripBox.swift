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
    
    @State var timer: TimeInterval = TimeInterval()
    @State private var seconds: TimeInterval = 60 * 60 * 12
    
    static let formatter: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute]
        return formatter
    }()
    
    var body: some View {
        
        ZStack{
            
            Image("lightmap")
                .resizable()
                .opacity(0.1)
                .blur(radius: 0.1, opaque: true)
            
            VStack{
                
                HStack{
                    Text("Start a \nTrip")
                        .font(.system(size: 35, weight: .bold, design: .default))
                    Spacer()
                }
                
                HStack(alignment: .center) {
                    ForEach(0..<items.count) { index in
                        
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
                
                Spacer()
                
                HStack{
                    HStack{
                        Text("Start")
                            .font(.system(size: 25, weight: .heavy))
                        Image(systemName: "arrow.forward")
                            .resizable()
                            .frame(width: 20, height: 20, alignment: .center)
                            .font(.system(size: 25, weight: .heavy))
                    }
                    .padding()
                    .background(Capsule().fill(Color.red.opacity(0.2)))
                    
                    Spacer()
                }
                
            }
            .padding()
            
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
    
    func updateUIView(_ datePicker: UIDatePicker, context: Context) {
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

struct StartTripBox_Previews: PreviewProvider {
    static var previews: some View {
        Start()
    }
}

