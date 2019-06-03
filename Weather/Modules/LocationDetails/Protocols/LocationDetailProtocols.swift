//
//  LocationDetailProtocols.swift
//  Weather
//
//  Created by Adrian Dumitru on 03/06/2019.
//  Copyright © 2019 Adrian Dumitru. All rights reserved.
//

import UIKit

protocol LocationDetailPresenterProtocol: class {
    
    var wireframe: LocationDetailWireFrameProtocol? {get set}
    var view: LocationDetailViewProtocol? {get set}
    
    func viewDidLoad()
    func backButtonPressed(from view: UIViewController)
    
}

protocol LocationDetailViewProtocol: class {
    func showLocationDetail(with location: Location)
}

protocol LocationDetailWireFrameProtocol: class {

}
