//
//  NetworkController.swift
//  YelpHelper
//
//  Created by dirtbag on 1/2/20.
//  Copyright © 2020 dirtbag. All rights reserved.
//

import Foundation

class NetworkController {

    public func loadYelpData(apiKey: String, url: URL, completed: @escaping (Data) -> Void) {

        var urlRequest = URLRequest(url: url)
        urlRequest.setValue(apiKey, forHTTPHeaderField: "Authorization")

        let task = URLSession.shared.dataTask(with: urlRequest) { (data, _, error) in

            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }

            guard let data = data else { return }

            completed(data)
        }
        task.resume()
    }
}
