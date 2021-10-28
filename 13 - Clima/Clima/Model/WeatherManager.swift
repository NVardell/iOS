//
//  WeatherManager.swift
//  Clima
//
//  Created by Nate Vardell on 10/28/21.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/find?appid=a445d3c87845a8e28e3f4852b0c4bcc0&units=imperial&q=Kalamazoo"
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q\(cityName)"
        print(urlString)
    }
}
