//
//  NetworkEngine.swift
//  Mint Bank
//
//  Created by Aboyeji Tolulope on 29/11/2020.
//

import Foundation

class NetworkEngine {
    /// Executes the web call and will decode the JSON response into the Codable object provided
    /// - Parameters:
    /// - endpoint: the endpoint to make the HTTP request against
    /// - completion: the JSON response converted to the provided Codable object, if successful, or failure otherwise
    //1
    class func request <T: Codable> (endpoint: Endpoint, completion: @escaping(Result <T, Error> ) -> ()) {
        //2
        
        var components = URLComponents()
        components.scheme = endpoint.scheme
        components.host = endpoint.baseURL
        components.path = endpoint.path
        
        
        
        
        //3
        guard
            let url = components.url
            else {
                return
        }
        
        //4
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = endpoint.method
        urlRequest.setValue(HeaderConstant.applicationJson, forHTTPHeaderField: HeaderConstant.accept)
        urlRequest.setValue(HeaderConstant.applicationJson, forHTTPHeaderField: HeaderConstant.contentType)
       
        
        urlRequest.httpMethod = endpoint.method
        urlRequest.httpBody = endpoint.body
        urlRequest.timeoutInterval = 20

        
        
        
        //5
        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: urlRequest) {
            data,
            response,
            error in
            
            // 6
            
            guard error == nil
                else {
                    
                    completion(.failure(error!))

                    
                    return
            }
            guard response != nil,
                let data = data
                else {
                    return
            }

            print("\nResponse: \(NSString(data: data, encoding: String.Encoding.utf8.rawValue)!)\n")
            
            guard let status = response as? HTTPURLResponse else {
                return
            }
            print(status.statusCode)
            
            
            
            DispatchQueue.main.async {
                if let responseObject =
                    try? JSONDecoder().decode(T.self, from: data) {
                    
                    //7
                    print("\nResponse: \(NSString(data: data, encoding: String.Encoding.utf8.rawValue)!)\n")
                    
                    completion(.success(responseObject))
                } else {
                    let error = NSError(domain: "", code: 200, userInfo: [NSLocalizedDescriptionKey: "Failed to decode response"])

                    completion(.failure(error))
                }
            }
        }
        //8
        dataTask.resume()
    }
}


