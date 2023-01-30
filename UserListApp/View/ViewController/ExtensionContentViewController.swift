//
//  ExtensionContentViewController.swift
//  UserListApp
//
//  Created by Sena Kurtak on 30.01.2023.
//

import UIKit

extension ContentViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.userList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell", for: indexPath) as! UserTableViewCell
        cell.userEmail.text = viewModel.userList[indexPath.row].email
        cell.userFirstName.text = viewModel.userList[indexPath.row].firstName
        cell.userLastName.text = viewModel.userList[indexPath.row].lastName
        let urlString = "\(viewModel.userList[indexPath.row].avatar)"
        cell.userImage.sd_setImage(with: URL(string: urlString))
        return cell
    }
}
