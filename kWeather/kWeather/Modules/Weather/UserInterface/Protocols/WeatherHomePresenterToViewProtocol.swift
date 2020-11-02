//
//  WeatherHomePresenterToViewProtocol.swift
//  kWeather
//
//  Created by Akilan on 02/11/20.
//  Copyright © 2020 aki. All rights reserved.
//

import Foundation

protocol WeatherHomePresenterToViewProtocol: class {
    func setPresenter(presenter: WeatherHomeViewToPresenterProtocol)
    func updateViewFor(forecast: WeatherForecast)
    func presentError()
}
