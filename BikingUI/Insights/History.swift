//
//  History.swift
//  BikingUI
//
//  Created by Sagar on 2021-06-13.
//

import FirebaseFirestore
import SwiftUI

struct History: View {
    
    @State var trips: Trips
    @State var selectedTrip: Activity?
    @State private var searchText : String = ""
    
    var filteredtrips : Trips {
        
        if searchText.isEmpty {
            return trips
        }else {
            return trips.filter( {$0.tripName.lowercased().contains(searchText.lowercased())})
        }
        
    }
    
    var body: some View {
        
        ScrollView {
            
            SearchBar(text: $searchText, placeholder: "Search")
                .padding(.horizontal, 8)
            
            if searchText.isEmpty {
                HistorySection(label: "This Month", trips: trips, selectedTrip: $selectedTrip)
                HistorySection(label: "2020", trips: trips, selectedTrip: $selectedTrip)
                    .padding(.bottom)
            } else {
                
                let filteredTrips = trips.filter( {$0.tripName.lowercased().contains(searchText.lowercased())})
                HistorySection(label: "Results", trips: filteredTrips, selectedTrip: $selectedTrip)
            }
        
            
        }
        
        .modifier(InlineNavBar(title: "History"))
        .sheet(item: $selectedTrip) { item in
            ActivityView(trip: item)
        }
        
    }
}

private struct HistorySection: View {
    
    @State var label: String = ""
    var trips: Trips
    @Binding var selectedTrip: Activity?
    
    var body: some View {
        LazyVStack {
            Section(header:
                VStack {
                    Leading {
                        Text(label)
                            .textCase(.uppercase)
                            .font(.system(size: 13, weight: .medium, design: .default))
                            .foregroundColor(.secondary)
                            .padding(.leading)
                    }
                    Divider()
                }
            ) {
                
                if trips.isEmpty {
                    Text("No Trips Founds")
                        .foregroundColor(.secondary)
                        .padding()
                } else {
                    ForEach(trips) { trip in
                        
                        Button(action: {
                            selectedTrip = trip
                        }, label: {
                            TripItemView(trip: trip)
                                .padding(.horizontal)
                        })
                    }
                }
                
            }
        }
        .padding(.top)
    }
}

struct History_Previews: PreviewProvider {
    static var previews: some View {
        let trips: Trips = [
            Activity(tripName: "Monday Afternoon",
                     distance: 10.55,
                     movingTime: 1000,
                     totalTime: 1200,
                     speed: 20.3,
                     pace: 45,
                     elevation: 70.0,
                     date: Timestamp()),
            Activity(tripName: "Sunday Afternoon",
                     distance: 12.55,
                     movingTime: 2000,
                     totalTime: 2500,
                     speed: 20.3,
                     pace: 45,
                     elevation: 70.0,
                     date: Timestamp()),
        ]

        NavigationView {
            History(trips: trips)
        }

    }
}
