//
//  WeatherDataPoint.swift
//  Forecast
//
//  Created by Bart Jacobs on 29/07/16.
//  Copyright © 2016 Cocoacasts. All rights reserved.
//

import Unbox

struct WeatherDataPoint: Unboxable {

    let time: Int
    let windSpeed: Double
    let fahrenheit: Double

    init(unboxer: Unboxer) {
        self.time = unboxer.unbox("time")
        self.windSpeed = unboxer.unbox("windSpeed")
        self.fahrenheit = unboxer.unbox("temperature")
    }
    
}
