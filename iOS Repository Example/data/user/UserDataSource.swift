//
//  UserDataSource.swift
//  iOS Repository Example
//
//  Created by Jeffrey McNally-Dawes on 2018-03-23.
//  Copyright © 2018 Jeffrey McNally-Dawes. All rights reserved.
//

import Foundation

protocol UserDataSource:class {
    func getUsers(onSuccess: @escaping ([User]) -> Void, onError: @escaping (String) -> Void)
    func saveUsers(users: [User], onSuccess: ([User]) -> Void, onError: (String) -> Void)
    func deleteUsers(onSuccess: () -> Void, onError: (String) -> Void)
}

extension UserDataSource {
    func saveUsers(users: [User], onSuccess: ([User]) -> Void, onError: (String) -> Void) {
        onError("Not implemented in this class.")
    }
    
    func deleteUsers(onSuccess: () -> Void, onError: (String) -> Void) {
        onError("Not implemented in this class.")
    }
}
