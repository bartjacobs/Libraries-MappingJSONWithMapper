//
//  ViewController.swift
//  Forecast
//
//  Created by Bart Jacobs on 29/07/16.
//  Copyright © 2016 Cocoacasts. All rights reserved.
//

import UIKit
import Unbox

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
            let weatherData: WeatherData = try Unbox(data)

            print(weatherData.lat)
            print(weatherData.long)

        } catch {
            print("Unable to Initialize Weather Data Due to Error (\(error))")
        }
    }

}
