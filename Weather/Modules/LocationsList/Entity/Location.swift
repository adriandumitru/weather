//
//  Location.swift
//  Weather
//
//  Created by Adrian Dumitru on 31/05/2019.
//  Copyright © 2019 Adrian Dumitru. All rights reserved.
//

import Foundation
import SwiftyJSON

class Location{
    
    var name: String
    var icon: String
    var temperature: Float
    var windSpeed: Float
    var windDegree: Float
    var clouds: Float
    
    init(){
        name = "-"
        icon = "10d"
        temperature = 273.15
        windSpeed = 0
        windDegree = 0
        clouds = 0
    }
    
    init(JSONData: JSON) {
        
        if let JSONDataName = JSONData["name"].string{
            name = JSONDataName
        }
        else{
            name = "-"
        }
        
        if let JSONDataIcon = JSONData["weather"][0]["icon"].string{
            icon = JSONDataIcon
        }
        else{
            icon = "10d"
        }
        
        if let JSONDataTemp = JSONData["main"]["temp"].float{
            temperature = JSONDataTemp
        }
        else{
            temperature = 273.15
        }
        
        if let JSONDataWindSpeed = JSONData["wind"]["speed"].float{
            windSpeed = JSONDataWindSpeed
        }
        else{
            windSpeed = 0
        }
        
        if let JSONDataWindDegree = JSONData["wind"]["deg"].float{
            windDegree = JSONDataWindDegree
        }
        else{
            windDegree = 0
        }
        
        if let JSONDataClouds = JSONData["clouds"]["all"].float{
            clouds = JSONDataClouds
        }
        else{
            clouds = 0
        }
        
    }
    
    func getImageURL() -> URL {
        let url = URL(string: "http://openweathermap.org/img/w/\(icon).png")
        return url!
    }
    
}
