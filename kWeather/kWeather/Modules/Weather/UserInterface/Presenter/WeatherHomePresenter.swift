//
//  WeatherHomePresenter.swift
//  kWeather
//
//  Created by Akilan on 02/11/20.
//  Copyright © 2020 aki. All rights reserved.
//

import Foundation

class WeatherHomePresenter: WeatherHomeViewToPresenterProtocol {
    
    private weak var view: WeatherHomePresenterToViewProtocol?
    private var interactor: WeatherHomePresenterToInteractorProtocol?
    private var router: WeatherHomePresenterToRouterProtocol?
    
    func setView(view: WeatherHomePresenterToViewProtocol) {
        self.view = view
    }
    
    func setInteractor(interactor: WeatherHomePresenterToInteractorProtocol) {
        self.interactor = interactor
    }
    
    func setRouter(router: WeatherHomePresenterToRouterProtocol) {
        self.router = router
    }
    
    func getWeatherForecastForCurrentLocation() {
        interactor?.getWeatherForecastForCurrentLocation()
    }
}

extension WeatherHomePresenter: WeatherHomeInteractorToPresenterProtocol {
    func didReceive(forecast: WeatherForecast) {
        view?.updateViewFor(forecast: forecast)
    }
    
    func didFailToReceiveForecast() {
        view?.presentError()
    }
}
