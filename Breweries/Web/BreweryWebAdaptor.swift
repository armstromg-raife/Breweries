//
//  BreweryWebAdaptor.swift
//  Breweries
//
//  Created by Armstrong, Raife (SPH) on 11/06/2024.
//

import Foundation

class BreweryWebAdaptor {
    static let shared = BreweryWebAdaptor()
    
    private init(){}
    
    private let baceUrl = "https://api.openbrewerydb.org/v1/breweries/"
    private let decoder = JSONDecoder()
    
    func search(for query: String, completion: @escaping([BreweryLightweight]) -> Void) {
        print("blah")
        let query = "autocomplete?query=\(query)"
        guard let url = URL(string:baceUrl + query) else{
            print("Invalid URL")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error:\(error.localizedDescription)")
            }
            
            guard let data = data, let results = try? self.decoder.decode([BreweryLightweight].self, from: data) else {
                print("Error decoding JSON")
                return
            }
            
            completion(results)
        }
        
        task.resume()
    }
    
}
