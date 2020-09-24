//
//  HistoryCell.swift
//  BikingUI
//
//  Created by Sagar on 2020-09-23.
//

import SwiftUI

struct ActivityCell: View {
    
    @State var activity: Test
    
    var body: some View {
        
        HStack(spacing: 15){
            Map()
                .frame(width: 80, height: 80, alignment: .center)
                .multilineTextAlignment(.leading)

            VStack(alignment: .leading, spacing: 5) {
                
                MainLabel(label: activity.name)
                
                HStack(alignment: .center){
                    DetailLabel(label: "Tuesday")
                    Spacer()
                    DetailLabel(label: "1.5km")
                    Spacer()
                    DetailLabel(label: "15:45")
                }
                .padding(.trailing)
            }
            
        }.padding(10)
        
    }
}

private struct DetailLabel: View {
    @State var label: String
    var body: some View {
        Text(label)
            .font(.callout)
            .foregroundColor(.secondary)
    }
}

private struct MainLabel: View {
    @State var label: String
    var body: some View {
        Text(label)
            .font(.system(size: 20, weight: .heavy))
            .foregroundColor(Color.black)
            .italic()
    }
}




struct ActivityCell_Previews: PreviewProvider {
    static var previews: some View {
        List{
            NavigationLink(
                destination: Text("Destination"),
                label: {
                    ActivityCell(activity: Test(name: "Afternoon Biking"))
                })
        }
    }
}
