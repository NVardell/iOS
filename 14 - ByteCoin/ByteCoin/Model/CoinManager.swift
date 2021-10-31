//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

protocol CoinManagerDelegate {
    func didUpdateRate(_ coinManager: CoinManager, rate: Double)
    func didFailWithError(_ coinManager: CoinManager, error: Error)
}

struct CoinManager {
    
    var delegate: CoinManagerDelegate?
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "72125371-DD07-4857-A503-868BF3FDF499"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]

    
    func getCoinPrice(for currency: String) {
        let url = "\(baseURL)/\(currency)?apikey=\(apiKey)"
        print("New Url = \(url)")
        performRequest(with: url)
    }
    
    
    func performRequest(with urlString: String) {
        
        // 1. Create URL Object String
        if let url = URL(string: urlString) {
            
            // 2. Create URL Session
            let session = URLSession(configuration: .default)
            
            // 3. Create Data Task for URL Session
            let task = session.dataTask(with: url) { data, response, error in
                if let error = error {
                    delegate?.didFailWithError(self, error: error)
                    return
                }
                if let safeData = data {
                    if let rate = self.parseJSON(safeData) {
                        print(rate)
                        delegate?.didUpdateRate(self, rate: rate)
                    }
                }
            }
            
            // 3. Run URL Session Task
            task.resume()
        }
    }
    
    
    func parseJSON(_ coinData: Data) -> Double? {
        // 1. Create Decoder Object (And verify data object adopts codable.)
        let decoder = JSONDecoder()
        
        // 2. Attempt JSON Decoding
        do {
            // Map JSON to Model Class
            let decodedData = try decoder.decode(CoinData.self, from: coinData)
            return decodedData.rate
        } catch {
            delegate?.didFailWithError(self, error: error)
            return nil
        }
    }
}
