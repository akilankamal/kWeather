//
//  WeatherHomePresenterToInteractorProtocol.swift
//  kWeather
//
//  Created by Akilan on 02/11/20.
//  Copyright © 2020 aki. All rights reserved.
//

import Foundation

protocol WeatherHomePresenterToInteractorProtocol: class {
    
    /*
    *  setPresenter
    *
    *  Discussion:
    *      Set Presenter as weak reference to Interactor.
    */
    func setPresenter(presenter: WeatherHomeInteractorToPresenterProtocol)
    
    /*
    *  set locationService
    *
    *  Discussion:
    *      Set locationService to Interactor.
    */
    func set(locationService: LocationService)
    
    /*
    *  set weatherService
    *
    *  Discussion:
    *      Set weatherService to Interactor.
    */
    func set(weatherService: WeatherService)
    
    /*
    *  getWeatherForecastForCurrentLocation
    *
    *  Discussion:
    *      Request from View > Presenter to get forecast for the current location.
    */
    func getWeatherForecastForCurrentLocation()
}
