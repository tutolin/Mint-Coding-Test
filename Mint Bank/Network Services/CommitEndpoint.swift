//
//  CommitEndpoint.swift
//  Mint Bank
//
//  Created by Fundall on 29/11/2020.
//

import Foundation

enum CommitEndpoint: Endpoint {

case getRepo


var scheme: String {
    switch self {
    
    default: return "https"
   
    }
}

var baseURL: String {
    switch self {
    
    default: return "api.github.com"
        
    }
}


var path: String {
    switch self {
    case .getRepo:
        return "/repos/rails/rails/commits"
  
    }
}

var method: String {
    switch self {
        
    case .getRepo:
        return "GET"
        
    
    }
}



var body: Data? {
    switch self {
    
    case .getRepo:
        return nil
    
    }
        
}

var jsonParameters: [String: Any]? {
    switch self {
   
    default:
        return nil
    }
}



var isAuthToken: Bool {
    switch self {
   
        
    default:
        return false
    }
}

}
