//
//  LocationsListWireframe.swift
//  Weather
//
//  Created by Adrian Dumitru on 31/05/2019.
//  Copyright © 2019 Adrian Dumitru. All rights reserved.
//

import UIKit

class LocationsListWireframe: LocationsListWireFrameProtocol {
    
    func pushToLocationDetail(with location: Location,from view: UIViewController) {
        let locationDetailViewController = view.storyboard?.instantiateViewController(withIdentifier: "LocationDetailsView") as! LocationDetailView
        LocationDetailWireFrame.createLocationDetailModule(with: locationDetailViewController, and: location)
        view.navigationController?.pushViewController(locationDetailViewController, animated: true)
    }
    
    class func createLocationsListModule(locationsListRef: LocationsListView) {
        let presenter: LocationsListPresenterProtocol & LocationsListOutputInteractorProtocol = LocationsListPresenter()
        
        locationsListRef.presenter = presenter
        locationsListRef.presenter?.wireframe = LocationsListWireframe()
        locationsListRef.presenter?.view = locationsListRef
        locationsListRef.presenter?.interactor = LocationsListInteractor()
        locationsListRef.presenter?.interactor?.presenter = presenter
    }
    
}

