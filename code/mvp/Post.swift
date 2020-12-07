//
//  Person.swift
//  pattern
//
//  Created by Igor Selivestrov on 23.06.2020.
//  Copyright © 2020 Igor Selivestrov. All rights reserved.
//

import Foundation

struct Post: Decodable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
