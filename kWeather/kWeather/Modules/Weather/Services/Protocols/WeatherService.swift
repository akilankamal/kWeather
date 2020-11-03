//
//  WeatherService.swift
//  kWeather
//
//  Created by Akilan on 02/11/20.
//  Copyright © 2020 aki. All rights reserved.
//

import Foundation

protocol WeatherService {
    
    /*
    *  getWeatherForecast
    *
    *  Discussion:
    *      Get weather forecast for the given latitude and longitude
    */
    func getWeatherForecast(for latitude: String, longitude: String, completion: @escaping (WeatherForecast?, Error?) -> ())
}
