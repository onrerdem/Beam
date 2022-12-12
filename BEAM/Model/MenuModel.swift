//
//  MenuModel.swift
//  BEAM
//
//  Created by onur erdem on 11.12.2022.
//

import Foundation


//Mark: - Request

class MenuRequestModel : Codable{
    var type : String?
    var token : String?
    var instanceName : String?
    
    enum CodingKeys: String, CodingKey {
        case type = "Type"
        case token = "Token"
        case instanceName = "InstanceName"
    }
    init(type: String? = "1", token: String? = nil, instanceName: String? = "ELDOR") {
        self.type = type
        self.token = token
        self.instanceName = instanceName
    }
    
}

//Mark: - Response

class MenuResponseModel: Codable {
    
    var hasError: Bool?
    let errorMessage: String?
    let result: [Menu]?

    enum CodingKeys: String, CodingKey {
        case hasError = "HasError"
        case errorMessage = "ErrorMessage"
        case result = "Result"
    }

    init(hasError: Bool? = nil, errorMessage: String?, result: [Menu]?) {
        self.hasError = hasError
        self.errorMessage = errorMessage
        self.result = result
    }
}

class Menu: Codable {
    var id: Int?
    var header : String?
    var icon: String?
    var type: Int?
    var isShowDashboard: Bool?

    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case header = "Header"
        case icon = "Icon"
        case type = "Type"
        case isShowDashboard = "IsShowDashboard"
    }
    init(id: Int? = nil, header: String? = nil, icon: String? = nil, type: Int? = nil, isShowDashboard: Bool? = nil) {
        self.id = id
        self.header = header
        self.icon = icon
        self.type = type
        self.isShowDashboard = isShowDashboard
    }

}
