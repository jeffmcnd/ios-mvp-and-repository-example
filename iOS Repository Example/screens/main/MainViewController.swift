//
//  ViewController.swift
//  iOS Repository Example
//
//  Created by Jeffrey McNally-Dawes on 2018-03-23.
//  Copyright © 2018 Jeffrey McNally-Dawes. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class MainViewController: UIViewController, MainView {
    
    private var presenter: MainPresenter!
    private var users: [User] = []
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let userLocalDataSource = UserLocalDataSource()
        let userRemoteDataSource = UserRemoteDataSource()
        let userRepo = UserRepo(
            localDataSource: userLocalDataSource,
            remoteDataSource: userRemoteDataSource
        )
        
        presenter = MainPresenter(view: self, userRepo: userRepo)
        presenter.start()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setList(users: [User]) {
        self.users = users
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func showError(error: String) {
        
    }
    
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell", for: indexPath) as! UserTableViewCell
        
        let user = users[indexPath.row]
        cell.userNameLabel.text = user.login
        cell.avatarImageView.af_setImage(withURL: URL(string: user.avatarUrl)!)
        
        return cell
    }
}

