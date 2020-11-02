//
//  WeatherForecast.swift
//  kWeather
//
//  Created by Akilan on 02/11/20.
//  Copyright © 2020 aki. All rights reserved.
//

import Foundation

struct WeatherForecast: Codable {
    let latitude: Double
    let longitude: Double
    let timezone: String
    let currently: CurrentForecast
}
