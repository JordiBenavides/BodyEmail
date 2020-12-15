//
//  ViewModelBodyEmail.swift
//  BodyEmail
//
//  Created by Jordi Milla on 15/12/2020.
//  Copyright © 2020 Jordi Milla Catalan. All rights reserved.
//

import Foundation
import UIKit
import Moya

let provider = MoyaProvider<BodyEmailAPI>()

class ViewModelBodyEmail {
    
    var refreshData = { () -> () in }
    var dataArray:[BodyEmail] = [] {
        didSet{
            refreshData()
        }
    }
    
    func retriveDataBoduEMail() {
        
        provider.request(.getBodyEmail) { result in
            switch result {
            case .success(let response):
                print("success")
                let array: [BodyEmail] = try! response.map(ResponseAPIArray.self).data
                self.dataArray = array
            case .failure:
                print("Error")
                
            }
        }
    }
}
