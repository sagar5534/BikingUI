//
//  ScoreBoard.swift
//  BikingUI
//
//  Created by Sagar on 2020-09-16.
//

import SwiftUI

struct ScoreBoard: View {
    
    @Binding var User: User

    var body: some View {
        VStack {
            VStack {
                Text(String(User.distance.format()))
                    .font(.system(size: 55, weight: .heavy))
                    .foregroundColor(Color.black)
                    .italic()
                Text("Kilometers")
                    .font(.callout)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
            }
            .padding()

            ZStack {
                RoundedRectangle(cornerRadius: 25.0, style: .circular)
                    .foregroundColor(.white)

                HStack(alignment: .top) {
                    
                    VStack {
                        Text(String(User.trips))
                            .font(.system(size: 20, weight: .heavy))
                            .foregroundColor(Color.black)
                            .italic()
                        Text("Trips")
                            .font(.callout)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.center)
                    }
                    .frame(maxWidth: .infinity)
                    
                    Divider()

                    VStack {
                        Text(String(User.movingTime.toTime(pad: false)))
                            .font(.system(size: 20, weight: .heavy))
                            .foregroundColor(Color.black)
                            .italic()
                        Text("Time")
                            .font(.callout)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.center)
                    }
                    .frame(maxWidth: .infinity)
                    
                    Divider()

                    VStack {
                        Text(User.avgSpeed.format())
                            .font(.system(size: 20, weight: .heavy))
                            .foregroundColor(Color.black)
                            .italic()
                        Text("Avg Speed")
                            .font(.callout)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.center)
                    }
                    .frame(maxWidth: .infinity)
                }
                .padding()
            }
            .padding(.leading)
            .padding(.trailing)
            .padding(.bottom)
        }
    }
}

struct ScoreBoardDetail: View {
    
    @State var activity: Activity
    
    var body: some View {
        VStack {
            VStack {
                Text(activity.distance.format())
                    .font(.system(size: 55, weight: .heavy))
                    .foregroundColor(Color.black)
                    .italic()
                Text("Kilometers")
                    .font(.callout)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
            }
            .padding()

            ZStack {
                RoundedRectangle(cornerRadius: 25.0, style: .circular)
                    .foregroundColor(.white)

                VStack{
                    HStack(alignment: .top) {
                        MinorLabel(value: activity.avgSpeed.format(), detail: "Avg Speed")
                        Divider()
                        MinorLabel(value: activity.fastestSpeed.format(), detail: "Fastest Speed")
                    }
                    .padding()
                    
                    HStack(alignment: .top) {
                        MinorLabel(value: activity.movingTime.toTime(pad: false), detail: "Moving Time")
                        Divider()
                        MinorLabel(value: activity.totalTime.toTime(pad: false), detail: "Total Time")
                    }
                    .padding()
                }
                
            }
            .padding(.leading)
            .padding(.trailing)
            .padding(.bottom)
        }
    }
}

private struct MinorLabel: View {
    @State var value: String
    @State var detail: String = ""

    var body: some View {
        VStack {
            Text(String(value))
                .font(.system(size: 20, weight: .heavy))
                .foregroundColor(Color.black)
                .italic()
            Text(detail)
                .font(.callout)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity)
    }
}

struct ScoreBoard_Previews: PreviewProvider {
    static var previews: some View {
        
        
        ScoreBoard(User: .constant(User(name: "", distance: 0, movingTime: 0, trips: 0, avgSpeed: 0, activity: [])))

        ScoreBoardDetail(activity: Activity())
            .previewLayout(.fixed(width: 400, height: 250))
    }
}
