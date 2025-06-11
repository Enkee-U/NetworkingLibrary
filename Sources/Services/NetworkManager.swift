//
//  NetworkManager.swift
//  NetworkPractice4
//
//  Created by Enkhtsetseg Unurbayar on 6/10/25.
//


import Foundation

@available(macOS 12.0, iOS 15.0, *)
public class NetworkManager: NetworkProtocol {
    
    public init() {}

    public func fetchData<T: Decodable>(from url: URL) async throws -> T {
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.invalidURL
        }
        
        do {
            let decodedData = try JSONDecoder().decode(T.self, from: data)
            return decodedData
        } catch {
            throw NetworkError.invalidJsonParsing
        }
    }
}
