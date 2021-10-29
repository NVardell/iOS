//
//  WeatherModel.swift
//  Clima
//
//  Created by Nate Vardell on 10/29/21.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation

struct WeatherModel {
    let conditionId: Int
    let cityName: String
    let temperature: Double
    
    // Computed Properties
    var temperatureString: String {
        return String(format: "%0.1d", temperature)
    }
    
    var conditionName: String {
        switch conditionId {
            case ...300:
                return "cloud.bolt"
            case ...400:
                return "cloud.drizzle"
            case ...600:
                return "cloud.rain"
            case ...700:
                return "cloud.snow"
            case ...800:
                return "cloud.moon.rain"
            case ...900:
                return "cloud.sun"
            default:
                return "moon"
        }
    }
    
}
