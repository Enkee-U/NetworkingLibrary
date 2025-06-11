//
//  NetworkError.swift
//  NetworkPractice4
//
//  Created by Enkhtsetseg Unurbayar on 6/10/25.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case invalidJsonParsing
}

extension NetworkError : LocalizedError{
    var errorDescription: String?{
        switch self {
        case .invalidURL:
            return "Invalid Url!!!"
        case .invalidJsonParsing:
            return "Invalid JSON parsing"
        }
    }
}
