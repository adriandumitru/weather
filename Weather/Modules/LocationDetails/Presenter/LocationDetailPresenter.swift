//
//  LocationDetailPresenter.swift
//  Weather
//
//  Created by Adrian Dumitru on 03/06/2019.
//  Copyright © 2019 Adrian Dumitru. All rights reserved.
//

import UIKit

class LocationDetailPresenter: LocationDetailPresenterProtocol {
    
    var view: LocationDetailViewProtocol?
    var wireframe: LocationDetailWireFrameProtocol?
    var location: Location?
    
    func viewDidLoad() {
        view?.showLocationDetail(with: location!)
    }
    
    func backButtonPressed(from view: UIViewController) {
        
    }
    
}
