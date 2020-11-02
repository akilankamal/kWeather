//
//  DarkSkyEndpoint.swift
//  kWeather
//
//  Created by Akilan on 02/11/20.
//  Copyright © 2020 aki. All rights reserved.
//

import Foundation

enum DarkSkyEndPoint: EndPoint {
    
    var scheme: String {
        switch self {
        default:
            return "https"
        }
    }
    
    var baseURL: String {
        switch self {
        default:
            return "api.darksky.net"
        }
    }
    
    var path: String {
        switch self {
        case .getWeatherForecast(let latitude, let longitude):
            return "/forecast/2bb07c3bece89caf533ac9a5d23d8417/\(latitude),\(longitude)"
        }
    }
    
    var parameters: [URLQueryItem] {
        switch self {
        default:
            return []
        }
    }
    
    var method: String {
        switch self {
        case .getWeatherForecast:
            return "GET"
        }
    }
    
    case getWeatherForecast(latitude: String, longitude: String)
}
