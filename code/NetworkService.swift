//
//  NetworkService.swift
//  pattern
//
//  Created by Igor Selivestrov on 21.06.2020.
//  Copyright © 2020 Igor Selivestrov. All rights reserved.
//

import UIKit
import Foundation
import CoreLocation

protocol NetworkServiceProtocol {
    func getPost(completion: @escaping (Result<[Post]?, Error>) -> Void)
    //func getWeather(local: CLLocation, completion: @escaping (Result<Weather?, Error>) -> Void)
    //func getCityimage(cityName: String?, completion: @escaping (Result<City?, Error>) -> Void)
}
class NetworkService: NetworkServiceProtocol {
    
    
    
    func getPost(completion: @escaping (Result<[Post]?, Error>) -> Void) {
        
        guard let urlString = Setting.shared.urlString as String? else { return  }
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error ) in
            
            if error != nil {
                completion(.failure(error!))
                return
            }
            guard let data = data else { return }
            do {
                
                let  jsonString = try JSONDecoder().decode([Post].self, from: data)
                
                completion(.success(jsonString))
            } catch {
                completion(.failure(error))
            }
            
            
        }
        .resume()
    }
    
    
    class func fetch(completion: @escaping (String) -> ())
    {
        guard let urlString = Setting.shared.urlString as String? else { return  }
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error ) in
            if error != nil {
                print("error")
            }
            guard let data = data else { return }
            guard let  jsonString = String(data: data, encoding: .utf8) else { return }
            completion(jsonString)
        }
        task.resume()
        
    }
}
