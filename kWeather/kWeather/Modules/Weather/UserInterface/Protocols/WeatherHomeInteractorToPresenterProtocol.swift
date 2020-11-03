//
//  WeatherHomeInteractorToPresenterProtocol.swift
//  kWeather
//
//  Created by Akilan on 02/11/20.
//  Copyright © 2020 aki. All rights reserved.
//

import Foundation

protocol WeatherHomeInteractorToPresenterProtocol: class {
    
    /*
    *  didReceive forecast
    *
    *  Discussion:
    *      Function to inform Presenter with the obtained forecast.
    */
    func didReceive(forecast:WeatherForecast)
    
    /*
    *  didFailToReceiveForecast
    *
    *  Discussion:
    *      Function to inform Presenter about failure in obtaining forecast.
    */
    func didFailToReceiveForecast()
}
