//
//  NetworkManager.swift
//  NetworkPractice4
//
//  Created by Enkhtsetseg Unurbayar on 6/10/25.
//

import Foundation

public class NetworkManager: NetworkProtocol {
/*
 This function is a reusable network fetcher that downloads data from a given URL,
 checks the response status, and decodes the data into any type that conforms to Decodable.


 */
 
 func fetchData<T: Decodable>(from url: URL) async throws -> T {
        
        let (data, response) = try await URLSession.shared.data(from: url)
        /*
         
         Asynchronously fetches data from the network.

         Uses URLSession.shared to make a request to the given URL.

         data is the raw Data received.

         response is the URL response object.

         try await is used because this can throw and suspends until the response is available.
         */
        
        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.invalidURL
            
        }
        /*
         Checks if the response is an HTTPURLResponse.

         Then ensures the HTTP status code is in the 200–299 success range.

         If not, it throws a custom error NetworkError.invalidURL.
         */
        do{
            let decoder = JSONDecoder()
            let decodedData = try decoder.decode(T.self, from: data)
            return decodedData
            
        }catch{
            throw NetworkError.invalidJsonParsing
        }
        /*Tries to decode the JSON data into the generic type T using JSONDecoder.
         
         If successful, returns the decoded value.

         If decoding fails, it throws a custom error NetworkError.invalidJsonParsing.
         */
        
    }
    
    
}
