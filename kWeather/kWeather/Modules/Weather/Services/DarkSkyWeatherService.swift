//
//  DarkSkyWeatherService.swift
//  kWeather
//
//  Created by Akilan on 02/11/20.
//  Copyright © 2020 aki. All rights reserved.
//

import Foundation

class DarkSkyWeatherService: WeatherService {
        
    func getWeatherForecast(for latitude: String, longitude: String, completion: @escaping (WeatherForecast?, Error?) -> ()) {
        NetworkLibrary.request(endPoint: DarkSkyEndPoint.getWeatherForecast(latitude: latitude, longitude: longitude)) { (result: Result<WeatherForecast, Error>) in
            switch result {
            case .success(let response):
                print("Response: ", response)
                completion(response, nil)
                
            case .failure(let error):
                print(error)
                completion(nil, error)
            }
        }
    }
}
