//
//  ForecastService.swift
//  Weathery
//
//  Created by Tony Kim on 8/25/17.
//  Copyright © 2017 Tony Kim. All rights reserved.
//

import Foundation

class ForecastService
{
    let forecastAPIKey: String
    let forecastBaseURL: URL?
    
    // forecastBaseUrl/forecastAPIKey/latitude,longitude
    init(APIKey: String)
    {
        self.forecastAPIKey = APIKey
        forecastBaseURL = URL(string: "https://api.darksky.net/forecast/\(APIKey)")
        
    }
    func getForecast(latitude: Double, longitude: Double, completion: @escaping
        (CurrentWeather?) -> Void)
    {
        if let forecastURL = URL(string: "\(forecastBaseURL!)/\(latitude),\(longitude)", relativeTo: forecastBaseURL!){
            
            let networkProcessor = NetworkProcessor(url: forecastURL)
            networkProcessor.downloadJSONFromURL({ (jsonDictionary) in
                if let currentWeatherDictionary = jsonDictionary?["currently"] as?
                    [String: Any] {
                    let currentWeather = CurrentWeather(weatherDictionary: currentWeatherDictionary)
                    completion(currentWeather)
                } else {
                    completion(nil)
                }
            })
            
        }
    }
}






