//
//  InsightHistory.swift
//  BikingUI
//
//  Created by Sagar on 2021-05-08.
//

import SwiftUI

struct Trip: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
//    var park: String
//    var state: String
//    var description: String

//    private var imageName: String
//    var image: Image {
//        Image(imageName)
//    }

//    private var coordinates: Coordinates
//    var locationCoordinate: CLLocationCoordinate2D {
//        CLLocationCoordinate2D(
//            latitude: coordinates.latitude,
//            longitude: coordinates.longitude)
//    }
//
//    struct Coordinates: Hashable, Codable {
//        var latitude: Double
//        var longitude: Double
//    }
}


struct InsightHistory: View {
    
    @State var trips: [Trip]
    
    var body: some View {
        
        GroupBox(label: Text("Recent Trips")) {
            ScrollView{
                ForEach(trips) { trip in
                    NavigationLink(destination: Text(trip.name)) {
                        TripItemView(trip: trip)
                    }
                    Divider()
                }
            }
        }
        .groupBoxStyle(HistoryGroupBoxStyle(color: .red))
        
    }
}

private struct TripItemView: View {
    
    @State var trip: Trip
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {

            Leading {
                Text("Yesterday")
                    .font(.system(size: 24, weight: .bold, design: .rounded))
                    .foregroundColor(.black)
            }
           
            Leading {
                Text("Monday Evening Run")
                    .font(.system(size: 18, weight: .semibold, design: .rounded))
                    .foregroundColor(.gray)
            }
            
            HStack(spacing: 20){
                HStack{
                    Image(systemName: "ruler")
                    Text("10Km")
                        .font(.system(size: 16, weight: .semibold, design: .rounded))

                }
                HStack{
                    Image(systemName: "timer")
                    Text("5'15")
                        .font(.system(size: 16, weight: .semibold, design: .rounded))

                }
                HStack{
                    Image(systemName: "clock")
                    Text("0:25")
                        .font(.system(size: 16, weight: .semibold, design: .rounded))

                }
            }
            .padding(.top)
        }
        
    }
}

private struct HistoryGroupBoxStyle: GroupBoxStyle {
    var color: Color
    
    @ScaledMetric var size: CGFloat = 1
    
    func makeBody(configuration: Configuration) -> some View {
        GroupBox(label:
                    HStack {
                        configuration.label
                            .foregroundColor(color)
                        Spacer(minLength: 0)
                    }
        ) {
            configuration.content
        }
    }
}

struct InsightHistory_Previews: PreviewProvider {
    static var previews: some View {
        
        let trips: [Trip] = [
            Trip(id: 1, name: "Sagar"),
            Trip(id: 2, name: "Om"),
        ]
        
        InsightHistory(trips: trips)
            .preferredColorScheme(.light)
        
        TripItemView(trip: trips[0])
            .previewLayout(.sizeThatFits)
    }
}
