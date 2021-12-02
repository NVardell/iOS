//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit
import CoreLocation

class WeatherViewController: UIViewController {

    var weatherManager = WeatherManager()
    let locationManager = CLLocationManager()
    
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        cityLabel.text = ""
        temperatureLabel.text = "0.0"
        // Request Location
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        // Listener - Search Text Field
        searchTextField.delegate = self
        // Listener - Weather Manager
        weatherManager.delegate = self
    }
    

    @IBAction func searchPressed(_ sender: UIButton) {
        searchTextField.endEditing(true)
        print(searchTextField.text!)
    }
    @IBAction func currentLocationPressed(_ sender: UIButton) {
        print("Requesting current location...")
        locationManager.requestLocation()
    }
    
}


// MARK: - UITextFieldDelegate
extension WeatherViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
        print(searchTextField.text!)
        return true
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            textField.text = "Type a City Name"
            return false
        }
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        // Validate user input
        if let city = searchTextField.text {
            weatherManager.fetchWeather(cityName: city)
            cityLabel.text = city
        }
        
        // Reset Search Text Field
        searchTextField.text = ""
    }
}


// MARK: - WeatherManagerDelegate
extension WeatherViewController: WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel) {
        print(weather) // Kalamazoo "lat": 42.2917, "lon": -85.5872
        DispatchQueue.main.async {
            self.cityLabel.text = weather.cityName
            self.temperatureLabel.text = weather.temperatureString
            self.conditionImageView.image = UIImage(systemName: weather.conditionName)
        }
    }
    func didFailWithError(_ weatherManager: WeatherManager, error: Error) {
        print(error)
    }
}


// MARK: - CLLocationManagerDelegate
extension WeatherViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("Got Location Data")
        if let location = locations.last {
            locationManager.stopUpdatingLocation()  // Grab current location & stop future attempts.
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            print("Lat: \(lat)\tLon:\(lon)")
            weatherManager.fetchWeather(latitude: lat, longitude: lon)
        }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}
