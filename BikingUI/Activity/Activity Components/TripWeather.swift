//
//  TripWeather.swift
//  BikingUI
//
//  Created by Sagar on 2021-05-25.
//

import SwiftUI

struct TripWeather: View {
    
    @ObservedObject var weatherapi = WeatherAPI(location: "Toronto, CA")

    var body: some View {
        GroupBox(label: Label("Weather", systemImage: "cloud.sun.fill")) {
            HStack(alignment: .center, spacing: 0) {
                HStack(alignment: .top, spacing: 0) {
                    let temp = weatherapi.weather?.main?.temp ?? 0

                    Text(temp < 0 ? "-" : "+")
                        .font(.system(size: 23 * 2, weight: .regular, design: .rounded))

                    let formatted = String(format: "%0.0f", temp)
                    Text(formatted)
                        .font(.system(size: 30 * 2, weight: .medium, design: .rounded))

                    Text("°C")
                        .font(.system(size: 15 * 2, weight: .medium, design: .default))
                }

                if weatherapi.icon != nil {
                    Image(uiImage: weatherapi.icon!)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 120, height: 120, alignment: .center)
                        .clipped()
                        .frame(width: 70, height: 70, alignment: .center)
                }

                Spacer()

                VStack(alignment: .trailing) {
                    Spacer()

                    Text(weatherapi.weather?.weather?.first?.weatherMsg ?? "")
                        .font(.system(size: 16, weight: .semibold, design: .rounded))
                        .foregroundColor(.secondary)
                        .lineLimit(2)
                        .fixedSize(horizontal: false, vertical: true)
                        .multilineTextAlignment(.trailing)

                    HStack {
                        let temp = weatherapi.weather?.main?.feelsLike ?? 0
                        let formatted = String(format: "%0.0f", temp)

                        Text("Feels Like ")
                            .font(.system(size: 16, weight: .semibold, design: .rounded))
                            .foregroundColor(.secondary)
                            .lineLimit(2)
                            .fixedSize(horizontal: false, vertical: true)
                            .multilineTextAlignment(.trailing)
                        Text((temp < 0 ? "-" : "+") + formatted)
                            .font(.system(size: 16, weight: .semibold, design: .rounded))
                            .foregroundColor(.primary)
                            .lineLimit(2)
                            .fixedSize(horizontal: false, vertical: true)
                            .multilineTextAlignment(.trailing)
                    }
                }
            }
            .frame(height: 70, alignment: .center)
        }
        .groupBoxStyle(InfoCardGroupBox(color: .blue))
    }
}

private struct InfoCardGroupBox: GroupBoxStyle {
    var color: Color

    @ScaledMetric var size: CGFloat = 1

    func makeBody(configuration: Configuration) -> some View {
        GroupBox(label: HStack {
            configuration.label
                .foregroundColor(color)
                .scaledToFit()
                .minimumScaleFactor(0.5)
                .lineLimit(2)
            Spacer()
        }) {
            configuration.content
                .padding(.top)
        }
    }
}

struct TripWeather_Previews: PreviewProvider {
    static var previews: some View {
        TripWeather()
    }
}
