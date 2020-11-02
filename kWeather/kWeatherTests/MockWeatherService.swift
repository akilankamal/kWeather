//
//  MockWeatherService.swift
//  kWeatherTests
//
//  Created by Akilan on 02/11/20.
//  Copyright © 2020 aki. All rights reserved.
//

import Foundation

enum MockWeatherError: Error {
    case invalidCoordinates(String)
}

class MockWeatherService: WeatherService {
    func getWeatherForecast(for latitude: String, longitude: String, completion: @escaping (WeatherForecast?, Error?) -> ()) {
        guard latitude == "59.337239", longitude == "18.062381" else {
            completion(nil, MockWeatherError.invalidCoordinates("Invalid coordinates"))
            return
        }
        
        do {
            let bundle = Bundle(for: type(of: self))
            let url = bundle.url(forResource: "DarkSkyResponse", withExtension: "json")!
             let data = try Data(contentsOf: url)
             let response = try JSONDecoder().decode(WeatherForecast.self, from: data)
            completion(response, nil)
        }
        catch {
            completion(nil, error)
        }
    }
}
