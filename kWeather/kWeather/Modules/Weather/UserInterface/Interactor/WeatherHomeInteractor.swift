//
//  WeatherHomeInteractor.swift
//  kWeather
//
//  Created by Akilan on 02/11/20.
//  Copyright © 2020 aki. All rights reserved.
//

import Foundation

class WeatherHomeInteractor: WeatherHomePresenterToInteractorProtocol {
    
    private weak var presenter: WeatherHomeInteractorToPresenterProtocol?
    private var locationService: LocationService?
    private var weatherService: WeatherService?
    
    func setPresenter(presenter: WeatherHomeInteractorToPresenterProtocol) {
        self.presenter = presenter
    }
    
    func set(locationService: LocationService) {
        self.locationService = locationService
        self.locationService?.setDelegate(delegate: self)
        self.locationService?.requestLocation()
    }
    
    func set(weatherService: WeatherService) {
        self.weatherService = weatherService
    }
    
    func getWeatherForecastForCurrentLocation() {
        self.locationService?.requestLocation()
    }
}

extension WeatherHomeInteractor: LocationServiceDelegate {
    func locationService(_ locationService: LocationService, didGetCurrentLocation location: (latitude: String, longitude: String)) {
        weatherService?.getWeatherForecast(for: location.latitude,
                                           longitude: location.longitude,
                                           completion: { [weak self] (forecast, error) in
                                            
                                            guard let weakSelf = self else {
                                                return
                                            }
                                            
                                            // Notify Presenter with failure for no / corrupted response
                                            guard let forecast = forecast else {
                                                weakSelf.presenter?.didFailToReceiveForecast()
                                                return
                                            }
                                            
                                            // Notify Presenter on successful reception of response
                                            weakSelf.presenter?.didReceive(forecast: forecast)
        })
    }
    
    func locationService(_ locationService: LocationService, didFailToGetCurrentLocation error: Error) {
        
        // Notify Presenter with failure 
        presenter?.didFailToReceiveForecast()
    }
}
