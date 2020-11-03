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
        
        // Create Presenter, Interactor and Router
        let presenter: WeatherHomeViewToPresenterProtocol & WeatherHomeInteractorToPresenterProtocol = WeatherHomePresenter()
        let interactor: WeatherHomePresenterToInteractorProtocol = WeatherHomeInteractor()
        let router: WeatherHomePresenterToRouterProtocol = WeatherHomeRouter()
        
        // Set Presenter to View
        view.setPresenter(presenter: presenter)
        
        // Set View, Interactor and Router to Presenter
        presenter.setView(view: view)
        presenter.setInteractor(interactor: interactor)
        presenter.setRouter(router: router)
        
        // Set Presenter to Interactor
        interactor.setPresenter(presenter: presenter)
        
        // Add LocationService and WeatherService to Interactor
        interactor.set(locationService: CoreLocationService())
        interactor.set(weatherService: DarkSkyWeatherService())
    }
}
