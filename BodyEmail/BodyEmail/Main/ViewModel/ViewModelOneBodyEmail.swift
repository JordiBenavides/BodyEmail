//
//  ViewModelOneBodyEmail.swift
//  BodyEmail
//
//  Created by Jordi Milla on 15/12/2020.
//  Copyright © 2020 Jordi Milla Catalan. All rights reserved.
//

import Foundation
import UIKit
import Moya

class ViewModelOneBodyEmail {
    
    let provider = MoyaProvider<BodyEmailAPI>()
    var id: Int?
    var refreshDataOneBodyEmail = { () -> () in }
    var dataOneBodyEmail: BodyEmail = BodyEmail(id: 10, name: "", email: "", body: "") {
        didSet {
            refreshDataOneBodyEmail()
        }
    }
    
    func requestBodyEmailById(id: Int) {
        provider.request(.getBodyEmailById(id: id)) { result in
            switch result {
            case .success(let response):
                print("success")
                let data: BodyEmail = try! response.map(ResponseAPI.self).data
                self.dataOneBodyEmail = data
            case .failure:
                print("Error")
            }
        }
    }
    
}
