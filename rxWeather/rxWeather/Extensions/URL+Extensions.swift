//
//  URL+Extensions.swift
//  rxWeather
//
//  Created by Fernando Martin Garcia Del Angel on 11/02/20.
//  Copyright © 2020 Fernando Martin Garcia Del Angel. All rights reserved.
//

import Foundation


extension URL {
    static func urlForWeatherAPI(city:String) -> URL? {
        return URL(string: "http://api.openweathermap.org/data/2.5/weather?q=\(city)&APPID={APIKEY}")
    }
}
