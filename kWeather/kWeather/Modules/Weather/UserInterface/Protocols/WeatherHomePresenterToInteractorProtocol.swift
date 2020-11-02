//
//  WeatherHomePresenterToInteractorProtocol.swift
//  kWeather
//
//  Created by Akilan on 02/11/20.
//  Copyright © 2020 aki. All rights reserved.
//

import Foundation

protocol WeatherHomePresenterToInteractorProtocol: class {
    func setPresenter(presenter: WeatherHomeInteractorToPresenterProtocol)
    func set(locationService: LocationService)
    func set(weatherService: WeatherService)
    func getWeatherForecastForCurrentLocation()
}
