//
//  UserTableViewCell.swift
//  UserListApp
//
//  Created by Sena Kurtak on 29.01.2023.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    @IBOutlet weak var userImage: UIImageView!
    
    @IBOutlet weak var userFirstName: UILabel!
    
    @IBOutlet weak var userLastName: UILabel!
    
    @IBOutlet weak var userEmail: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
