//
//  WeatherHomeConfigurator.swift
//  kWeather
//
//  Created by Akilan on 02/11/20.
//  Copyright © 2020 aki. All rights reserved.
//

import Foundation

class WeatherHomeConfigurator: WeatherHomeConfigurable {
    
    static func configure(view: WeatherHomePresenterToViewProtocol) {
        let presenter: WeatherHomeViewToPresenterProtocol & WeatherHomeInteractorToPresenterProtocol = WeatherHomePresenter()
        let interactor: WeatherHomePresenterToInteractorProtocol = WeatherHomeInteractor()
        let router: WeatherHomePresenterToRouterProtocol = WeatherHomeRouter()
        
        view.setPresenter(presenter: presenter)
        presenter.setView(view: view)
        presenter.setInteractor(interactor: interactor)
        presenter.setRouter(router: router)
        interactor.setPresenter(presenter: presenter)
        
        interactor.set(locationService: CoreLocationService())
        interactor.set(weatherService: DarkSkyWeatherService())
    }
}
