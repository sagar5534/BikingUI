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
    @Binding var totalKm: String
    @Binding var movingTime: String
    @Binding var avgPace: String
    @Binding var fastestPace: String
    
    var body: some View {
        VStack {
            VStack {
                Text(totalKm)
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
                        Text(String(45))
                            .font(.system(size: 20, weight: .heavy))
                            .foregroundColor(Color.black)
                            .italic()
                        Text("")
                            .font(.callout)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.center)
                    }
                    .frame(maxWidth: .infinity)
                    
                    Divider()

                    VStack {
                        Text(String(34))
                            .font(.system(size: 20, weight: .heavy))
                            .foregroundColor(Color.black)
                            .italic()
                        Text("")
                            .font(.callout)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.center)
                    }
                    .frame(maxWidth: .infinity)
                    
                    Divider()

                    VStack {
                        Text(String(5))
                            .font(.system(size: 20, weight: .heavy))
                            .foregroundColor(Color.black)
                            .italic()
                        Text("")
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

private struct MinorLabel: View {
    @Binding var value: String
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

        ScoreBoardDetail(totalKm: .constant("45.98"), movingTime: .constant("56"), avgPace: .constant("40:34"), fastestPace: .constant("34"))
            .previewLayout(.fixed(width: 400, height: 250))
    }
}
