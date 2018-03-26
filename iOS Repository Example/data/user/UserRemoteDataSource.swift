//
//  UserRemoteLocalDataSource.swift
//  iOS Repository Example
//
//  Created by Jeffrey McNally-Dawes on 2018-03-23.
//  Copyright © 2018 Jeffrey McNally-Dawes. All rights reserved.
//

import Foundation
import Alamofire
import CodableAlamofire

class UserRemoteDataSource : UserDataSource {    
    
    func getUsers(onSuccess: @escaping ([User]) -> Void, onError: @escaping (String) -> Void) {
        let decoder = JSONDecoder()
        Alamofire.request(
            URL(string: "https://api.github.com/users")!,
            method: .get)
            .responseDecodableObject(decoder: decoder) { (response: DataResponse<[User]>) in
                guard response.result.isSuccess else {
                    onError(response.result.error as! String)
                    return
                }
                
                onSuccess(response.result.value!)
        }
    }
    
}
