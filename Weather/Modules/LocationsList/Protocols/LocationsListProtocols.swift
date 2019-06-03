//
//  LocationsListProtocols.swift
//  Weather
//
//  Created by Adrian Dumitru on 31/05/2019.
//  Copyright © 2019 Adrian Dumitru. All rights reserved.
//

import UIKit

protocol LocationsListViewProtocol: class {
    func showLocations(with locations: [Location])
}

protocol LocationsListPresenterProtocol: class {
    var interactor: LocationsListInputInteractorProtocol? {get set}
    var view: LocationsListViewProtocol? {get set}
    var wireframe: LocationsListWireFrameProtocol? {get set}
    
    func viewDidLoad()
    func showLocationSelection(with location: Location, from view: UIViewController)
}

protocol LocationsListInputInteractorProtocol: class {
    var presenter: LocationsListOutputInteractorProtocol? {get set}

    func getLocationsList()
}

protocol LocationsListOutputInteractorProtocol: class {
    func locationstListDidFetch(locationsList: [Location])
}

protocol LocationsListWireFrameProtocol: class {
    func pushToLocationDetail(with location: Location,from view: UIViewController)
    static func createLocationsListModule(locationsListRef: LocationsListView)
}
