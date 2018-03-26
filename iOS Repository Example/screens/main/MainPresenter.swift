//
//  MainPresenter.swift
//  iOS Repository Example
//
//  Created by Jeffrey McNally-Dawes on 2018-03-23.
//  Copyright © 2018 Jeffrey McNally-Dawes. All rights reserved.
//

import Foundation

class MainPresenter {
    
    private weak var view : MainView? = nil
    private let userRepo : UserRepo
    
    init(view: MainView, userRepo: UserRepo) {
        self.view = view
        self.userRepo = userRepo
    }
    
    func start() {
        userRepo.getUsers(onSuccess: { (users) in
            self.view?.setList(users: users)
        }, onError: { (error) in
            self.view?.showError(error: error)
        })
    }
    
}
