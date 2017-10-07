//
//  CurrentWeather.swift
//  Weathery
//
//  Created by Tony Kim on 8/25/17.
//  Copyright © 2017 Tony Kim. All rights reserved.
//

import Foundation

class CurrentWeather
{
    let temperature: Int?
    let humidity: Int?
    let precipProbability: Int?
    let summary: String?
    
    struct WeatherKeys {
        static let temperature = "temperature"
        static let humidity = "humidity"
        static let precipProbability = "precipProbability"
        static let summary = "summary"
    }
    
    init(weatherDictionary: [String : Any])
    {
        temperature = weatherDictionary[WeatherKeys.temperature] as? Int
        if let humidityDouble = weatherDictionary[WeatherKeys.humidity] as? Double {
            humidity = Int(humidityDouble*100)
        } else {
            humidity = nil
        }
        if let precipDouble = weatherDictionary[WeatherKeys.precipProbability] as? Double {
            precipProbability = Int(precipDouble * 100)
        } else {
            precipProbability = nil
        }
        summary = weatherDictionary[WeatherKeys.summary] as? String
    }
    
    /*
     {
        time: 1503711444,
        summary: "Clear",
        icon: "clear-day",
        nearestStormDistance: 142,
        nearestStormBearing: 57,
        precipIntensity: 0,
        precipProbability: 0,
        temperature: 62.23,
        apparentTemperature: 62.23,
        dewPoint: 53.04,
        humidity: 0.72,
        windSpeed: 5.67,
        windGust: 8.51,
        windBearing: 260,
        visibility: 9.74,
        cloudCover: 0.08,
        pressure: 1010.25,
        ozone: 283.36,
        uvIndex: 1
     }
 
    */
    
    
}
