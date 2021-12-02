//
//  WeatherManager.swift
//  Clima
//
//  Created by Nate Vardell on 10/28/21.
//

import Foundation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    func didFailWithError(_ weatherManager: WeatherManager, error: Error)
}

struct WeatherManager {
    
    var delegate: WeatherManagerDelegate?
    
    let weatherURL = "https://api.openweathermap.org/data/2.5/find?appid=a445d3c87845a8e28e3f4852b0c4bcc0&units=imperial"
    
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(with: urlString)
    }
    func fetchWeather(latitude: Double, longitude: Double) {
        let urlString = "\(weatherURL)&lat=\(latitude)&lon=\(longitude)"
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String) {
        // 1. Setup URL
        if let url = URL(string: urlString) {
            
            // 2. Setup URL Session
            let session = URLSession(configuration: .default)
            
            // 3. Give URLSession a Task
            let task = session.dataTask(with: url) { data, response, error in
                if let error = error {
                    self.delegate?.didFailWithError(self, error: error)
                    return
                }
                if let safeData = data {
                    // Since Closures are Anonymous Functions, the keyword 'self' is required.
                    if let weather = self.parseJSON(safeData) {
                        delegate?.didUpdateWeather(self, weather: weather)
                    }
                }
            }
            
            // 4. Initiate Task
            task.resume()
        }
    }
    
    
    func parseJSON(_ weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            
            let weatherId = decodedData.list[0].weather[0].id
            let temp = decodedData.list[0].main.temp
            let name = decodedData.list[0].name
            
            let weather = WeatherModel(conditionId: weatherId, cityName: name, temperature: temp)
            return weather
        } catch {
            delegate?.didFailWithError(self, error: error)
            return nil
        }
    }
    

    
}
