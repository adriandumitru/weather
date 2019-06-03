//
//  WebServiceClient.swift
//  Weather
//
//  Created by Adrian Dumitru on 31/05/2019.
//  Copyright © 2019 Adrian Dumitru. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class WebServiceClient{
    static let sharedService = WebServiceClient()
    
    private let manager: Alamofire.SessionManager = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 10
        configuration.timeoutIntervalForResource = 10
        return Alamofire.SessionManager(configuration: configuration)
    }()
    
    func getWeatherData(city: String, result: @escaping (Location) -> Void, errorHandling: @escaping (Error) -> Void){
        manager.request("http://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=dd1d05fbb3a88e9f20aaca7fbd101bee").responseString  { response in
            
            switch response.result {
            case .success:
                let resultObject = Location(JSONData: JSON(parseJSON:response.result.value!))
                result(resultObject)
            case .failure(let error):
                errorHandling(error)
            }
            
        }
    }
    
    
    func getWeatherData(lat: Double, lon: Double, result: @escaping (Location) -> Void, errorHandling: @escaping (Error) -> Void){
        manager.request("http://api.openweathermap.org/data/2.5/weather?lat=\(lat)&lon=\(lon)&appid=dd1d05fbb3a88e9f20aaca7fbd101bee").responseString  { response in
            
            switch response.result {
            case .success:
                let resultObject = Location(JSONData: JSON(parseJSON:response.result.value!))
                result(resultObject)
            case .failure(let error):
                errorHandling(error)
            }
            
        }
    }
    
}
