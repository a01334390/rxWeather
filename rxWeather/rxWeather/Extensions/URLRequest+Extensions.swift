//
//  URLRequest+Extensions.swift
//  rxWeather
//
//  Created by Fernando Martin Garcia Del Angel on 11/02/20.
//  Copyright © 2020 Fernando Martin Garcia Del Angel. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

struct Resource<T> {
    let url : URL
}

extension URLRequest {
    static func load<T : Decodable>(resource: Resource<T>) -> Observable<T> {
        return Observable.from([resource.url])
            .flatMap { url -> Observable<Data> in
                let request = URLRequest(url: url)
                return URLSession.shared.rx.data(request: request)
        }.map { data -> T in
            return try JSONDecoder().decode(T.self, from: data)
        }.asObservable()
    }
}
