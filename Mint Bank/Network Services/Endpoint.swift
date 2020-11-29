//
//  Endpoint.swift
//  Mint Bank
//
//  Created by Aboyeji Tolulope on 29/11/2020.
//

import Foundation

protocol Endpoint {
    /// HTTP or HTTPS
    var scheme: String {
        get
    }
    // Example: "api.mintbank.com"
    var baseURL: String {
        get
    }
    // "/services/string/"
    var path: String {
        get
    }
  
    // "GET"
    var method: String {
        get
    }
    var body: Data? {
        get
    }
    
    var isAuthToken: Bool {
        get
    }
}
