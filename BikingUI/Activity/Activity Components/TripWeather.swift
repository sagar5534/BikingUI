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
        ContentBox(label:"Weather") {
            HStack(alignment: .center, spacing: 0) {
                WeatherIcon()
                Spacer()
                RightDetail()
            }
        }
        .environmentObject(weatherapi)
    }
}

private struct RightDetail: View {
    @EnvironmentObject var weatherapi: WeatherAPI

    var body: some View {
        VStack(alignment: .trailing) {
            InfoLabelOnly(label: weatherapi.weather?.weather?.first?.weatherMsg ?? "")
            InfoLabel(label: "Feels Like", value: weatherapi.weather?.main?.feelsLike ?? 0)
            InfoLabel(label: "High", value: weatherapi.weather?.main?.feelsLike ?? 0)
            InfoLabel(label: "Low", value: weatherapi.weather?.main?.feelsLike ?? 0)
        }
    }

    struct InfoLabel: View {
        var label: String
        var value: Double

        @ViewBuilder
        var body: some View {
            let formatted = String(format: "%0.0f", value)

            Text(label + (value < 0 ? " -" : " +") + formatted)
                .font(.system(size: 15, weight: .regular, design: .default))
                .foregroundColor(.secondary)
        }
    }

    struct InfoLabelOnly: View {
        var label: String

        @ViewBuilder
        var body: some View {
            Text(label)
                .font(.system(size: 15, weight: .regular, design: .default))
                .foregroundColor(.secondary)
        }
    }
}

private struct WeatherIcon: View {
    @EnvironmentObject var weatherapi: WeatherAPI

    var body: some View {
        let temp = weatherapi.weather?.main?.temp ?? 0
        let formatted = String(format: "%0.0f", temp)

        HStack(alignment: .top, spacing: 0) {
            HStack(spacing: 0) {
                Text(temp < 0 ? "-" : "+")
                    .font(.system(size: 35, weight: .medium, design: .default))

                Text(formatted)
                    .font(.system(size: 50, weight: .medium, design: .default))
            }

            Text("°C")
                .font(.system(size: 24, weight: .medium, design: .default))
        }

        if weatherapi.icon != nil {
            Image(uiImage: weatherapi.icon!)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 120, height: 120, alignment: .center)
                .clipped()
                .frame(width: 70, height: 70, alignment: .center)
        }
    }
}

struct TripWeather_Previews: PreviewProvider {
    static var previews: some View {
        TripWeather()
    }
}
