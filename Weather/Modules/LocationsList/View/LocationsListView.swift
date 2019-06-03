//
//  LocationsViewController.swift
//  Weather
//
//  Created by Adrian Dumitru on 31/05/2019.
//  Copyright © 2019 Adrian Dumitru. All rights reserved.
//

import UIKit
import AlamofireImage

class LocationsListView: UIViewController,LocationsListViewProtocol {

    @IBOutlet var locationsTableView: UITableView!
    
    var presenter:LocationsListPresenterProtocol?
    var locationsList = [Location]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        LocationsListWireframe.createLocationsListModule(locationsListRef: self)
        presenter?.viewDidLoad()
    }
    
    func showLocations(with locations: [Location]){
        locationsList = locations
        locationsTableView.reloadData()
    }

}

class LocationsTableViewCell: UITableViewCell {
    @IBOutlet var weatherIcon: UIImageView!
    @IBOutlet var locationLbl: UILabel!
    @IBOutlet var temperatureLbl: UILabel!
}

extension LocationsListView: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = locationsTableView.dequeueReusableCell(withIdentifier: "locationCell", for: indexPath) as! LocationsTableViewCell
        let location = locationsList[indexPath.row]
        let temperatureCelsius: Int = Int(location.temperature - 273.15)
        
        cell.weatherIcon.af_setImage(withURL: location.getImageURL())
        cell.locationLbl.text = location.name
        cell.temperatureLbl.text = "\(temperatureCelsius) °C"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locationsList.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.showLocationSelection(with: locationsList[indexPath.row], from: self)
    }
    
}

