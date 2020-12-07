//
//  Setting.swift
//  pattern
//
//  Created by Igor Selivestrov on 21.06.2020.
//  Copyright © 2020 Igor Selivestrov. All rights reserved.
//

import UIKit


class Setting {
    
    static let shared = Setting()
    
    
    var urlString: String? = "https://jsonplaceholder.typicode.com/posts"
    var urlCityimage: String? = "https://pixabay.com/api/?key=15825429-557d2a97462d3187b5af1064a&image_type=photo"
    var urlWeather: String? = "https://api.weather.yandex.ru/v1/forecast?extra=true&lang=ru_RU"
    var keyApi: String! = "X-Yandex-API-Key"
    var valueApi: String! = "e3984661-eeb3-424a-a0e5-8be4c90eb538"
    private init() {
        
    }
}
