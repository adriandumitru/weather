//
//  LocationDetailsWireFrame.swift
//  Weather
//
//  Created by Adrian Dumitru on 03/06/2019.
//  Copyright © 2019 Adrian Dumitru. All rights reserved.
//

import UIKit

class LocationDetailWireFrame: LocationDetailWireFrameProtocol {
    
    class func createLocationDetailModule(with locationDetailRef: LocationDetailView, and location: Location) {
        let presenter = LocationDetailPresenter()
        presenter.location = location
        locationDetailRef.presenter = presenter
        locationDetailRef.presenter?.view = locationDetailRef
        locationDetailRef.presenter?.wireframe = LocationDetailWireFrame()
    }
    
    
}

