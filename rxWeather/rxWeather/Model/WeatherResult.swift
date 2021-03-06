//
//  WeatherResult.swift
//  rxWeather
//
//  Created by Fernando Martin Garcia Del Angel on 11/02/20.
//  Copyright © 2020 Fernando Martin Garcia Del Angel. All rights reserved.
//

import Foundation

struct Weather : Decodable {
    let temp: Double
    let humidity : Double
}

extension WeatherResult {
    static var empty : WeatherResult {
        return WeatherResult(main: Weather(temp: 0.0, humidity: 0.0))
    }
}

struct WeatherResult : Decodable {
    let main : Weather
}
