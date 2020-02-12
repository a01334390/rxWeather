//
//  ViewController.swift
//  rxWeather
//
//  Created by Fernando Martin Garcia Del Angel on 11/02/20.
//  Copyright © 2020 Fernando Martin Garcia Del Angel. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class ViewController: UIViewController {
    
    @IBOutlet weak var cityNameTextField: UITextField!
    
    @IBOutlet weak var temperatureLabel: UILabel!
    
    @IBOutlet weak var humidtyLabel: UILabel!
    
    let disposeBag = DisposeBag()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.cityNameTextField.rx.value.subscribe(onNext: { city in
            if let city = city {
                if city.isEmpty {
                    self.displayWeather(nil)
                } else {
                    self.fetchWeather(by: city)
                }
            }
        }).disposed(by: disposeBag)
    }
    
    private func displayWeather(_ weather: Weather?) {
        if let weather = weather {
            self.temperatureLabel.text = "\(weather.temp) F"
            self.humidtyLabel.text = "\(weather.humidity) 💦"
        } else {
            self.temperatureLabel.text = "🙈"
            self.temperatureLabel.text = "✌️"
        }
    }
    
    private func fetchWeather(by city: String) {
        guard let cityEncoded = city.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed),
            let url = URL.urlForWeatherAPI(city: cityEncoded) else {
                return
        }
        let resource = Resource<WeatherResult>(url: url)
        URLRequest.load(resource: resource)
            .subscribe(onNext: { result in
                let weather = result.main
                self.displayWeather(weather)
            }).disposed(by: disposeBag)
    }


}

