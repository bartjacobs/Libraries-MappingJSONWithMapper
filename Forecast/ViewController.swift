//
//  ViewController.swift
//  Forecast
//
//  Created by Bart Jacobs on 29/07/16.
//  Copyright © 2016 Cocoacasts. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        fetchWeatherData()
    }

    // MARK: - Helper Methods

    private func fetchWeatherData() {
        // Helpers
        let sharedSession = NSURLSession.sharedSession()

        let latitude = 51.525598
        let longitude = -0.118750
        let apiKey = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"

        if let url = NSURL(string: "https://api.forecast.io/forecast/\(apiKey)/\(latitude),\(longitude)") {
            // Create Data Task
            let dataTask = sharedSession.dataTaskWithURL(url) { (data, response, error) -> Void in
                if let requestError = error {
                    print("Unable to Fetch Weather Data")
                    print("\(requestError), \(requestError.localizedDescription)")

                } else if let weatherData = data {
                    self.processWeatherData(weatherData)
                }
            }
            
            dataTask.resume()
        }
    }

    private func processWeatherData(data: NSData) {
        do {
            if let JSON = try NSJSONSerialization.JSONObjectWithData(data, options: []) as? NSDictionary,
                let weatherData = WeatherData.from(JSON) {
                print(weatherData.lat)
                print(weatherData.long)
                print(weatherData.windSpeed)
                print(weatherData.fahrenheit)

                for dataPoint in weatherData.hourlyDataPoints {
                    print(dataPoint.fahrenheit)
                }
            }

        } catch {
            print("Unable to Initialize Weather Data")
        }
    }

}
