//
//  WeatherData.swift
//  Forecast
//
//  Created by Bart Jacobs on 29/07/16.
//  Copyright © 2016 Cocoacasts. All rights reserved.
//

import Mapper

struct WeatherData: Mappable {

    let lat: Double
    let long: Double
    let windSpeed: Double
    let fahrenheit: Double
    let hourlyDataPoints: [WeatherDataPoint]

    init(map: Mapper) throws {
        lat = try map.from("latitude")
        long = try map.from("longitude")

        windSpeed = try map.from("currently.windSpeed")
        fahrenheit = try map.from("currently.temperature")

        hourlyDataPoints = try map.from("hourly.data")
    }
    
}
