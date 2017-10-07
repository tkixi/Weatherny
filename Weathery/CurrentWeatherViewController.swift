
//
//  CurrentWeatherViewController.swift
//  Weathery
//
//  Created by Tony Kim on 8/25/17.
//  Copyright © 2017 Tony Kim. All rights reserved.
//

import UIKit

class CurrentWeatherViewController: UIViewController {

    @IBOutlet weak var cityTextLabel: UILabel!
    
    @IBOutlet weak var backgroundImageView: UIImageView!

    @IBOutlet weak var temperatureLabel: UILabel!
    
    let forecastAPIKey = "4801082e76d88970a1cbea6f31b3a3b4"
    let coordinate: (lat: Double, long: Double) = (37.8267,-122.4233)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let forecastService = ForecastService(APIKey: forecastAPIKey)
        forecastService.getForecast(latitude: coordinate.lat, longitude: coordinate.long)
            { (currentWeather) in
            if let currentWeather = currentWeather {
                DispatchQueue.main.async {
                    if let temperature = currentWeather.temperature {
                        self.temperatureLabel.text = "\(temperature)"
                    } else {
                        self.temperatureLabel.text = "-"
                    }
            }
        }
    }

    
}
}
