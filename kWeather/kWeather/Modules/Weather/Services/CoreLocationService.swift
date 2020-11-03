//
//  CoreLocationService.swift
//  kWeather
//
//  Created by Akilan on 02/11/20.
//  Copyright © 2020 aki. All rights reserved.
//

import Foundation
import CoreLocation

class CoreLocationService: NSObject, LocationService {
    
    private weak var delegate: LocationServiceDelegate?
    private let locationManager = CLLocationManager()
    
    override init() {
        super.init()
        locationManager.pausesLocationUpdatesAutomatically = true
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.delegate = self
    }
    
    func setDelegate(delegate: LocationServiceDelegate?) {
        self.delegate = delegate
    }
    
    func requestLocation() {
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
    }
}

extension CoreLocationService: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else {
            
            // Notifiy delegate with default coordinates
            delegate?.locationService(self, didGetCurrentLocation: ("0", "0"))
            return
        }
        
        // Notify delegate with obtained latitude and longitude
        delegate?.locationService(self, didGetCurrentLocation: (
            latitude: String(location.coordinate.latitude),
            longitude: String(location.coordinate.longitude))
        )
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
        // Notify delegate with error
        delegate?.locationService(self, didFailToGetCurrentLocation: error)
    }
}
