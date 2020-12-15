//
//  BodyEmail.swift
//  BodyEmail
//
//  Created by Jordi Milla on 15/12/2020.
//  Copyright © 2020 Jordi Milla Catalan. All rights reserved.
//

import Foundation

struct ResponseAPIArray: Codable {
    
    let data:[BodyEmail]
}

struct BodyEmail: Codable {
    
    let id: Int
    let name: String
    let email: String
    let body: String
}
