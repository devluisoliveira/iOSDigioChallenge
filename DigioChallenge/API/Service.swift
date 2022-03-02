//
//  Service.swift
//  DigioChallenge
//
//  Created by Luis Eduardo Silva Oliveira on 21/02/22.
//

import Foundation

final class Service {
    static let shared = Service()
    
    func listProducts(completion: @escaping (ProductResponse?, Error?) -> ()) {
        guard let url = URL(string: "\(API_BASE)") else {return}
        URLSession.shared.dataTask(with: url) { data, res, err in
            if let err = err {
                completion(nil, err)
                return
            }
            do {
                guard let data = data else {return}
                let products = try JSONDecoder().decode(ProductResponse.self, from: data)
                completion(products, nil)
            } catch let err {
                completion(nil, err)
                return
            }
        }.resume()
    }
}
