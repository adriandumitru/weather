//
//  LocationsListInteractor.swift
//  Weather
//
//  Created by Adrian Dumitru on 31/05/2019.
//  Copyright © 2019 Adrian Dumitru. All rights reserved.
//

import UIKit
import Foundation
import CoreLocation

class LocationsListInteractor: LocationsListInputInteractorProtocol {
    
    weak var presenter: LocationsListOutputInteractorProtocol?
    var locationsList: [Location]
    var currentLocation: Location
    var tokyoLocation: Location
    var londonLocation: Location
    
    
    init(){
        locationsList = [Location]()
        currentLocation = Location()
        tokyoLocation = Location()
        londonLocation = Location()
        LocationService.sharedInstance.delegate = self
    }

    func buildLocationsList(){
        locationsList.removeAll()
        locationsList.append(currentLocation)
        locationsList.append(londonLocation)
        locationsList.append(tokyoLocation)
    }
    
    func getLocationsList() {
        WebServiceClient.sharedService.getWeatherData(city: "London", result: {locationObject in
            self.londonLocation = locationObject
            self.buildLocationsList()
            DispatchQueue.main.async {
                 self.presenter?.locationstListDidFetch(locationsList: self.locationsList)
            }
            
        }, errorHandling: {error in
            print(error)
        })
        
        WebServiceClient.sharedService.getWeatherData(city: "Tokyo", result: {locationObject in
            self.tokyoLocation = locationObject
            self.buildLocationsList()
            DispatchQueue.main.async {
                self.presenter?.locationstListDidFetch(locationsList: self.locationsList)
            }
            
        }, errorHandling: {error in
            print(error)
        })
    }
}

extension LocationsListInteractor: LocationServiceDelegate{
    func tracingLocation(_ currentLocation: CLLocation) {
        LocationService.sharedInstance.delegate = nil
        WebServiceClient.sharedService.getWeatherData(lat: currentLocation.coordinate.latitude, lon: currentLocation.coordinate.longitude, result: {locationObject in
            self.currentLocation = locationObject
            self.buildLocationsList()
            DispatchQueue.main.async {
                self.presenter?.locationstListDidFetch(locationsList: self.locationsList)
            }
        }, errorHandling: {error in
            print(error)
        })
        
    }
    
    func tracingLocationDidFailWithError(_ error: NSError) {
        print(error)
    }
}
