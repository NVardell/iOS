//
//  WeatherData.swift
//  Clima
//
//  Created by Nate Vardell on 10/28/21.
//

import Foundation

struct WeatherData: Codable {
    let message: String
    let cod: String
    let count: Int
    let list: [List]
}

struct List: Codable {
    let id: Int
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Codable {
    let temp: Double
    let feels_like: Double
    let temp_min: Double
    let temp_max: Double
    let pressure: Int
    let humidity: Int
}

struct Weather: Codable {
    let id: Int
    let main: String
    let description: String
}
