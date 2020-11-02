//
//  WeatherHomeInteractorToPresenterProtocol.swift
//  kWeather
//
//  Created by Akilan on 02/11/20.
//  Copyright © 2020 aki. All rights reserved.
//

import Foundation

protocol WeatherHomeInteractorToPresenterProtocol: class {
    func didReceive(forecast:WeatherForecast)
    func didFailToReceiveForecast()
}
