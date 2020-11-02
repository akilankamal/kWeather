//
//  WeatherHomeViewToPresenterProtocol.swift
//  kWeather
//
//  Created by Akilan on 02/11/20.
//  Copyright © 2020 aki. All rights reserved.
//

import Foundation

protocol WeatherHomeViewToPresenterProtocol: class {
    func setView(view: WeatherHomePresenterToViewProtocol)
    func setInteractor(interactor: WeatherHomePresenterToInteractorProtocol)
    func setRouter(router: WeatherHomePresenterToRouterProtocol)
    func getWeatherForecastForCurrentLocation()
}
