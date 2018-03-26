//
//  UserRepo.swift
//  iOS Repository Example
//
//  Created by Jeffrey McNally-Dawes on 2018-03-23.
//  Copyright © 2018 Jeffrey McNally-Dawes. All rights reserved.
//

import Foundation

class UserRepo : UserDataSource {
    
    private let localDataSource : UserDataSource
    private let remoteDataSource : UserDataSource
    
    init(localDataSource: UserDataSource, remoteDataSource: UserDataSource) {
        self.localDataSource = localDataSource
        self.remoteDataSource = remoteDataSource
    }
    
    func getUsers(onSuccess: @escaping ([User]) -> Void, onError: @escaping (String) -> Void) {
        localDataSource.getUsers(onSuccess: { (localUsers) in
            if (localUsers.isEmpty) {
                self.remoteDataSource.getUsers(onSuccess: { (remoteUsers) in
                    self.localDataSource.saveUsers(
                        users: remoteUsers,
                        onSuccess: onSuccess,
                        onError: onError
                    )
                }, onError: onError)
            } else {
                onSuccess(localUsers)
            }
        }, onError: onError)
    }
    
}
