//
//  Weather.swift
//  BikingUI
//
//  Created by Sagar on 2021-05-21.
//

import Alamofire
import AlamofireImage
import Foundation
import SwiftUI

class WeatherAPI: ObservableObject {
    
    @Published var weather: WeatherResponse? = nil
    @Published var icon: UIImage? = nil
    
    init(location: String) {
        getWeather(location: location)
    }
    
    func getWeather(location: String) {
        let url = "https://api.openweathermap.org/data/2.5/weather"
        let apiKey = "c7bc2b3e65eea423b6ef65996a980b33"
        let units = "metric"
        
        let param = [
            "q": location,
            "appid": apiKey,
            "units": units
        ]
        
        AF.request(url, parameters: param)
            .validate()
            .responseDecodable(of: WeatherResponse.self) { response in
                guard let resp = response.value else {
                    print(response.error?.errorDescription)
                    return
                }
                self.weather = resp
                self.getIcon()
            }
    }
    
    func getIcon() {
        let url = "https://openweathermap.org/img/wn/04n@4x.png"

        AF.request(url)
            .responseImage { response in
                if case .success(let image) = response.result {
                    self.icon = image
                }
            }
    }
    
}


// MARK: - WeatherResponse
struct WeatherResponse: Codable {
    let weather: [Weather]?
    let main: Main?
    let wind: Wind?
}


// MARK: - Main
struct Main: Codable {
    let temp, feelsLike, tempMin, tempMax: Double?
    let pressure, humidity: Int?

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure, humidity
    }
}


// MARK: - Weather
struct Weather: Codable {
    let id: Int
    let weatherMsg, weatherDescription, icon: String

    enum CodingKeys: String, CodingKey {
        case id
        case weatherMsg = "main"
        case weatherDescription = "description"
        case icon
    }
}

// MARK: - Wind
struct Wind: Codable {
    let speed: Double?
    let deg: Int?
}
