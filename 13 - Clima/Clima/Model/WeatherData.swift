//
//  WeatherData.swift
//  Clima
//
//  Created by Nate Vardell on 10/28/21.
//

import Foundation

struct WeatherData: Decodable {
    let message: String
    let cod: String
    let count: Int
    let list: [List]
}

struct List: Decodable {
    let id: Int
    let name: String
    let main: Main
}

struct Main: Decodable {
    let temp: Double
    let feels_like: Double
    let temp_min: Double
    let temp_max: Double
    let pressure: Int
    let humidity: Int
}
