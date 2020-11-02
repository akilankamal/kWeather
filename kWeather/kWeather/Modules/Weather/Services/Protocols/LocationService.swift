//
//  LocationService.swift
//  kWeather
//
//  Created by Akilan on 02/11/20.
//  Copyright © 2020 aki. All rights reserved.
//

import Foundation

protocol LocationServiceDelegate: class {
    func locationService(_ locationService: LocationService, didGetCurrentLocation location: (latitude: String, longitude: String))
    func locationService(_ locationService: LocationService, didFailToGetCurrentLocation error: Error)
}

protocol LocationService: class {
    func setDelegate(delegate: LocationServiceDelegate?)
    func requestLocation()
}
