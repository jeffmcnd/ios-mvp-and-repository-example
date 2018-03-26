//
//  UserTableViewCell.swift
//  iOS Repository Example
//
//  Created by Jeffrey McNally-Dawes on 2018-03-26.
//  Copyright © 2018 Jeffrey McNally-Dawes. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    
    // MARK: Properties
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
