//
//  LoginModel.swift
//  BEAM
//
//  Created by onur erdem on 11.12.2022.
//

import Foundation


//Mark: - Request

class LoginRequestModel: Codable {
    var userId: String?
    var password: String?
    var companyId: Int?
    var instanceName: String?
    var culture: String?
    var deviceToken: String?
    
    enum CodingKeys: String, CodingKey {
        case userId = "UserId"
        case password = "Password"
        case companyId = "CompanyId"
        case instanceName = "InstanceName"
        case culture = "Culture"
        case deviceToken = "DeviceToken"
    }
    
    init(userId: String? = nil, password: String? = nil, companyId: Int? = 100, instanceName: String? = "ELDOR", culture: String? = "tr-TR", deviceToken: String? = "") {
        self.userId = userId
        self.password = password
        self.companyId = companyId
        self.instanceName = instanceName
        self.culture = culture
        self.deviceToken = deviceToken
    }
    
}

//Mark: - Response

    class LoginResponseModel: Codable {
        
        
        var hasError: Bool?
        var errorMessage: String?
        var result: [Login]?

        enum CodingKeys: String, CodingKey {
            case hasError = "HasError"
            case errorMessage = "ErrorMessage"
            case result = "Result"
        }

        
        init(hasError: Bool? = nil, errorMessage: String? = nil, result: [Login]? = nil) {
            self.hasError = hasError
            self.errorMessage = errorMessage
            self.result = result
        }

    }

    class Login: Codable {
        var token: String?

        enum CodingKeys: String, CodingKey {
            case token = "Token"
        }

        init(token: String?) {
            self.token = token
        }
    }

