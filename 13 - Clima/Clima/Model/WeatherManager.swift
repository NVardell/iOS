//
//  WeatherManager.swift
//  Clima
//
//  Created by Nate Vardell on 10/28/21.
//

import Foundation

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/find?appid=a445d3c87845a8e28e3f4852b0c4bcc0&units=imperial"
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        print("\n\n")
        print(urlString)
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String) {
        // 1. Setup URL
        if let url = URL(string: urlString) {
            // 2. Setup URL Session
            let session = URLSession(configuration: .default)
            
            // 3. Give URLSession a Task
            let task = session.dataTask(with: url) { data, response, error in
                if let error = error {
                    print(error)
                    return
                }
                if let safeData = data {
                    // Since Closures are Anonymous Functions, the keyword 'self' is required.
                    self.parseJSON(weatherData: safeData)
                }
            }
            
            // 4. Initiate Task
            task.resume()
        }
    }
    
    func parseJSON(weatherData: Data) {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            print("\n\n Decoded City Name is = \(decodedData.list[0].name)")
            print("\n\n Decoded City Temp is = \(decodedData.list[0].main.temp)")
        } catch {
            print(error)
        }
    }
    
}
