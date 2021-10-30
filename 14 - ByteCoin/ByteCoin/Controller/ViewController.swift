//
//  ViewController.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let coinManager = CoinManager()
    
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var bitcoinLabel: UIStackView!
    @IBOutlet weak var currencyPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currencyPicker.dataSource = self
        currencyPicker.delegate = self
    }


}



// MARK: - UIPickerViewDataSource
extension ViewController: UIPickerViewDataSource {
    // How many columns we want in our UIPicker
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    // How many rows we want in our UIPicker
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        coinManager.currencyArray.count
    }
}



// MARK: - UIPickerViewDelegate
extension ViewController: UIPickerViewDelegate {
    // Outputs String that is the title for the given row.
    // On initial load, this will call the method above once for every row
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coinManager.currencyArray[row]
    }
    // Triggered everytime user selects a row
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(row)
    }
}
