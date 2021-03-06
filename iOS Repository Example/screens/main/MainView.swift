//
//  MainView.swift
//  iOS Repository Example
//
//  Created by Jeffrey McNally-Dawes on 2018-03-23.
//  Copyright © 2018 Jeffrey McNally-Dawes. All rights reserved.
//

import Foundation

protocol MainView:class {
    func setList(users: [User])
    func showError(error: String)
}
