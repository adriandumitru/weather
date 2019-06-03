//
//  LocationsListPresenter.swift
//  Weather
//
//  Created by Adrian Dumitru on 31/05/2019.
//  Copyright © 2019 Adrian Dumitru. All rights reserved.
//

import UIKit

class LocationsListPresenter: LocationsListPresenterProtocol {
    
    var wireframe: LocationsListWireFrameProtocol?
    var view: LocationsListViewProtocol?
    var interactor: LocationsListInputInteractorProtocol?
    var presenter: LocationsListPresenterProtocol?
    
    func showLocationSelection(with location: Location, from view: UIViewController) {
        wireframe?.pushToLocationDetail(with: location, from: view)
    }
    
    func viewDidLoad() {
        self.loadLocationsList()
    }
    
    func loadLocationsList() {
        interactor?.getLocationsList()
    }
    
}

extension LocationsListPresenter: LocationsListOutputInteractorProtocol {
    
    func locationstListDidFetch(locationsList: [Location]) {
        view?.showLocations(with: locationsList)
    }
    
}
