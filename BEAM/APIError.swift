//
//  APIError.swift
//  BEAM
//
//  Created by onur erdem on 11.12.2022.
//

import Foundation

enum APIError: String,Error {
    
    case URLError
    case EncodeError
    case DecodeError
    case StatusError
    case NoData
    case NoConnection
    
 
}
    
