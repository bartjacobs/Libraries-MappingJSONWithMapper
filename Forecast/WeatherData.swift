//
//  WeatherData.swift
//  Forecast
//
//  Created by Bart Jacobs on 29/07/16.
//  Copyright © 2016 Cocoacasts. All rights reserved.
//

import Unbox

struct WeatherData: Unboxable {

    let lat: Double
    let long: Double

    init(unboxer: Unboxer) {
        self.lat = unboxer.unbox("latitude")
        self.long = unboxer.unbox("longitude")
    }

}