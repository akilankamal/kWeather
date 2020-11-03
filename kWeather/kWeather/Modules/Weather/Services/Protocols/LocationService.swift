//
//  LocationService.swift
//  kWeather
//
//  Created by Akilan on 02/11/20.
//  Copyright © 2020 aki. All rights reserved.
//

import Foundation

protocol LocationServiceDelegate: class {
    
    /*
    *  didGetCurrentLocation
    *
    *  Discussion:
    *      Supply current location coordinates.
    */
    func locationService(_ locationService: LocationService, didGetCurrentLocation location: (latitude: String, longitude: String))
    
    /*
    *  didFailToGetCurrentLocation
    *
    *  Discussion:
    *      Fails in an attempt to get current location.
    */
    func locationService(_ locationService: LocationService, didFailToGetCurrentLocation error: Error)
}

protocol LocationService: class {
    
    /*
    *  setDelegate
    *
    *  Discussion:
    *      Set a LocationServiceDelegate to LocationService in order to request current location.
    */
    func setDelegate(delegate: LocationServiceDelegate?)
    
    /*
    *  requestLocation
    *
    *  Discussion:
    *      Request a single location update.
    */
    func requestLocation()
}
