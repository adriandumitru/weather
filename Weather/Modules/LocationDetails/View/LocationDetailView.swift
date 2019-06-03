//
//  LocationDetailView.swift
//  Weather
//
//  Created by Adrian Dumitru on 03/06/2019.
//  Copyright © 2019 Adrian Dumitru. All rights reserved.
//

import UIKit


class LocationDetailView: UIViewController,LocationDetailViewProtocol {
    
    @IBOutlet var weatherImage: UIImageView!
    @IBOutlet var windLbl: UILabel!
    @IBOutlet var cloudLbl: UILabel!
    
    var presenter: LocationDetailPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
    
    func showLocationDetail(with location: Location) {
        title = location.name
        
        weatherImage.af_setImage(withURL: location.getImageURL())
        windLbl.text = "Wind: \(location.windSpeed) km/h"
        cloudLbl.text = "Clouds: \(location.clouds) %"
    }
    
}


