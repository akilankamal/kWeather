//
//  WeatherHomePresenterToViewProtocol.swift
//  kWeather
//
//  Created by Akilan on 02/11/20.
//  Copyright © 2020 aki. All rights reserved.
//

import Foundation

protocol WeatherHomePresenterToViewProtocol: class {
    
    /*
    *  setPresenter
    *
    *  Discussion:
    *      Set Presenter to View.
    */
    func setPresenter(presenter: WeatherHomeViewToPresenterProtocol)
    
    /*
    *  updateViewFor
    *
    *  Discussion:
    *      Update with for the given WeatherForecast.
    */
    func updateViewFor(forecast: WeatherForecast)
    
    /*
    *  presentError
    *
    *  Discussion:
    *      Incase of failure, alert the user.
    */
    func presentError()
}
