//
//  WeatherHomeViewToPresenterProtocol.swift
//  kWeather
//
//  Created by Akilan on 02/11/20.
//  Copyright © 2020 aki. All rights reserved.
//

import Foundation

protocol WeatherHomeViewToPresenterProtocol: class {
    
    /*
    *  setView
    *
    *  Discussion:
    *      Set View as weak reference to Presenter.
    */
    func setView(view: WeatherHomePresenterToViewProtocol)
    
    /*
    *  setInteractor
    *
    *  Discussion:
    *      Set Interactor to Presenter.
    */
    func setInteractor(interactor: WeatherHomePresenterToInteractorProtocol)
    
    /*
    *  setRouter
    *
    *  Discussion:
    *      Set Router to Presenter.
    */
    func setRouter(router: WeatherHomePresenterToRouterProtocol)
    
    /*
    *  getWeatherForecastForCurrentLocation
    *
    *  Discussion:
    *      Request from View to get forecast for the current location.
    */
    func getWeatherForecastForCurrentLocation()
}
