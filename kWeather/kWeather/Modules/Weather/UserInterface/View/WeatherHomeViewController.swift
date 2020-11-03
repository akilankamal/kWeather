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
    
    private var activityView: UIActivityIndicatorView?
    
    @IBOutlet private weak var icon: UIImageView!
    @IBOutlet private weak var timezoneLabel: UILabel!
    @IBOutlet private weak var temperatureLabel: UILabel!
    @IBOutlet private weak var summaryLabel: UILabel!
    @IBOutlet private weak var feelsLikeLabel: UILabel!
    @IBOutlet private weak var windSpeedLabel: UILabel!
    @IBOutlet private weak var humidityLabel: UILabel!
    @IBOutlet private weak var dewPtLabel: UILabel!
    @IBOutlet private weak var uvIndexLabel: UILabel!
    @IBOutlet private weak var visibilityLabel: UILabel!
    @IBOutlet private weak var pressureLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Show progress as LocationService attempts to get location information
        // and forecast information on app launch
        showActivityIndicator()
    }
    
    // Button action to get weather forecast for the current location
    @IBAction func didSelectCurrentLocation(_ sender: UIButton) {
        showActivityIndicator()
        presenter?.getWeatherForecastForCurrentLocation()
    }
    
    private func showActivityIndicator() {
        activityView = UIActivityIndicatorView(style: .large)
        activityView?.center = self.view.center
        self.view.isUserInteractionEnabled = false
        self.view.addSubview(activityView!)
        activityView?.startAnimating()
    }

    private func hideActivityIndicator(){
        if (activityView != nil){
            self.view.isUserInteractionEnabled = true
            activityView?.stopAnimating()
        }
    }
}

extension WeatherHomeViewController: WeatherHomePresenterToViewProtocol {
    func setPresenter(presenter: WeatherHomeViewToPresenterProtocol) {
        self.presenter = presenter
    }
    
    func updateViewFor(forecast: WeatherForecast) {
        hideActivityIndicator()
        icon.image = UIImage(named: forecast.currently.icon)
        timezoneLabel.text = forecast.timezone
        temperatureLabel.text = String(forecast.currently.temperature) + "˚"
        summaryLabel.text = forecast.currently.summary + "."
        feelsLikeLabel.text = String(forecast.currently.apparentTemperature) + "˚"
        windSpeedLabel.text = String(forecast.currently.windSpeed) + " mph"
        humidityLabel.text = String(forecast.currently.humidity) + "%"
        dewPtLabel.text = String(forecast.currently.dewPoint) + "˚"
        uvIndexLabel.text = String(forecast.currently.uvIndex)
        visibilityLabel.text = String(forecast.currently.visibility) + "+ mi"
        pressureLabel.text = String(forecast.currently.pressure) + " mb"
    }
    
    func presentError() {
        hideActivityIndicator()
        let alert = UIAlertController(title: "Error", message: "Problem occured in getting data. Try after sometime.", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

        self.present(alert, animated: true, completion: nil)
    }
}

