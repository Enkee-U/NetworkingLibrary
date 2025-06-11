//
//  NetwrkProtocol.swift
//  NetworkPractice4
//
//  Created by Enkhtsetseg Unurbayar on 6/10/25.
//

import Foundation

protocol NetworkProtocol {
    func fetchData<T: Decodable>(from url: URL) async throws -> T
}
/*
 🔍 Explanation:
 This is a generic async throwing function that performs a network call, validates the response, and decodes the returned JSON into a Swift type.

 It’s generic, so T can be any type that conforms to Decodable — like Post, [Comment], or even String.

 It’s marked async throws, meaning:

 async: it suspends while waiting for the network call to finish.

 throws: if an error occurs (bad URL, decoding issue, bad status code), it will throw an error to the caller.


 */
