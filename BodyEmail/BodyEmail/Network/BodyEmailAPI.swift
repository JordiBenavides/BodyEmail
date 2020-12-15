//
//  BodyEmailAPI.swift
//  BodyEmail
//
//  Created by Jordi Milla on 15/12/2020.
//  Copyright © 2020 Jordi Milla Catalan. All rights reserved.
//

import Foundation
import Moya

enum BodyEmailAPI {
    
    case getBodyEmail
    case getBodyEmailById(id: Int)
}

extension BodyEmailAPI:TargetType,AccessTokenAuthorizable {
    public var baseURL: URL { return URL(string: "https://gorest.co.in/public-api")!}
    
    public var path: String {
        switch self {
        case .getBodyEmail:
            return "comments"
        case .getBodyEmailById(id: let id):
            return "comments/\(id)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getBodyEmail:
            return .get
        case .getBodyEmailById(id: _):
            return .get
        }
    }
    
    var authorizationType: AuthorizationType {
        switch self {
        case .getBodyEmail:
            return .bearer
        case .getBodyEmailById(id: _):
            return .bearer
        }
    }
    
    public var task: Task {
        switch self {
        case .getBodyEmail:
            return .requestPlain
        case .getBodyEmailById(id: _):
            return .requestPlain
        }
    }
    
    public var validationType: ValidationType {
        return .none
    }
    
    public var sampleData: Data {
        return "".data(using: String.Encoding.utf8)!
    }
    
    public var headers: [String : String]? {
        return nil
    }
    
}
