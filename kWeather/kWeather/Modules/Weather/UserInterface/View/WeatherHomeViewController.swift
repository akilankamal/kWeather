//
//  WeatherHomeViewController.swift
//  kWeather
//
//  Created by Akilan on 02/11/20.
//  Copyright © 2020 aki. All rights reserved.
//

import UIKit

class WeatherHomeViewController: UIViewController {
    
    private var presenter: WeatherHomeViewToPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension WeatherHomeViewController: WeatherHomePresenterToViewProtocol {
    func setPresenter(presenter: WeatherHomeViewToPresenterProtocol) {
        self.presenter = presenter
    }
    
    func updateViewFor(forecast: WeatherForecast) {
        print(forecast.timezone)
    }
}

