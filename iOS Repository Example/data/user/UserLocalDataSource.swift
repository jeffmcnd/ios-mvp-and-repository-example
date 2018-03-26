//
//  UserLocalDataSource.swift
//  iOS Repository Example
//
//  Created by Jeffrey McNally-Dawes on 2018-03-23.
//  Copyright © 2018 Jeffrey McNally-Dawes. All rights reserved.
//

import Foundation

class UserLocalDataSource : UserDataSource {
    
    private var users = [User]()
    
    func getUsers(onSuccess: @escaping ([User]) -> Void, onError: @escaping (String) -> Void) {
        onSuccess(users)
    }
    
    func saveUsers(users: [User], onSuccess: ([User]) -> Void, onError: (String) -> Void) {
        self.users.append(contentsOf: users)
        onSuccess(self.users)
    }
    
    func deleteUsers(onSuccess: () -> Void, onError: (String) -> Void) {
        users.removeAll()
        onSuccess()
    }
    
}
