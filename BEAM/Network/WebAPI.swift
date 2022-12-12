//
//  WebAPI.swift
//  BEAM
//
//  Created by onur erdem on 11.12.2022.
//

import Foundation

class WebAPI {
    func LoginPost(userCode : String, userPass : String, completion: @escaping (Result<LoginResponseModel, APIError>) -> Void) {
        guard let url = URL(string: Constant.loginURL) else {
                return 
            }

        let loginData = LoginRequestModel(userId: userCode, password: userPass)
        
        guard let jsonData = try? JSONEncoder().encode(loginData) else {
                return
            }
            
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.setValue("application/json", forHTTPHeaderField: "Accept")
            request.httpBody = jsonData
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil else {
                let error = APIError.NoConnection
                completion(Result.failure(error))
                return
            }
            guard let data = data else {
                let error = APIError.NoData
                completion(Result.failure(error))
                return
            }
            guard let response = response as? HTTPURLResponse, (200 ..< 299) ~= response.statusCode else {
                let error = APIError.StatusError
                completion(Result.failure(error))
                return
            }
            do {
                let result = try JSONDecoder().decode(LoginResponseModel.self, from: data)
                completion(Result.success(result))
                
                
            } catch {
                let error = APIError.DecodeError
                completion(Result.failure(error))
            }
        }.resume()
        }
    func menuPost(tokenData : String,completion: @escaping (Result<MenuResponseModel, APIError>) -> Void) {
        guard let url = URL(string: Constant.menuURL) else {
            let error = APIError.URLError
            completion(Result.failure(error))
            return
        }
        
        let menuData = MenuRequestModel(type: Constant.menuType, token: tokenData, instanceName: Constant.instanceName)
        
        guard let jsonData = try? JSONEncoder().encode(menuData) else {
            let error = APIError.EncodeError
            completion(Result.failure(error))
            return
            }
            
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.setValue("application/json", forHTTPHeaderField: "Accept")
            request.httpBody = jsonData
            URLSession.shared.dataTask(with: request) { data, response, error in
                guard error == nil else {
                    let error = APIError.NoConnection
                    completion(Result.failure(error))
                    return
                }
                guard let data = data else {
                    let error = APIError.NoData
                    completion(Result.failure(error))
                    return
                }
                guard let response = response as? HTTPURLResponse, (200 ..< 299) ~= response.statusCode else {
                    let error = APIError.StatusError
                    completion(Result.failure(error))
                    return
                }
                do {
                    let result = try JSONDecoder().decode(MenuResponseModel.self, from: data)
                    completion(Result.success(result))
                    
                    
                } catch {
                    let error = APIError.DecodeError
                    completion(Result.failure(error))
                }
            }.resume()
    }
}
