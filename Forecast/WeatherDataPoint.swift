//
//  WeatherDataPoint.swift
//  Forecast
//
//  Created by Bart Jacobs on 29/07/16.
//  Copyright © 2016 Cocoacasts. All rights reserved.
//

import Mapper

struct WeatherDataPoint: Mappable {

    let time: Int
    let windSpeed: Double
    let fahrenheit: Double

    init(map: Mapper) throws {
        time = try map.from("time")
        windSpeed = try map.from("windSpeed")
        fahrenheit = try map.from("temperature")
    }
    
}
