//
//  ContentViewController.swift
//  UserListApp
//
//  Created by Sena Kurtak on 29.01.2023.
//

import UIKit
import SDWebImage

class ContentViewController: UIViewController {
    
    @IBOutlet weak var userListLabel: UILabel!
    
    @IBOutlet weak var userTableView: UITableView!
    
    var viewModel = ContentViewModel(networkManager: NetworkManager())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        userTableView.delegate = self
        userTableView.dataSource = self
        viewModel.delegate = self
        viewModel.restapiRead()
    }
    
    func configure(){
        userTableView.register(UINib(nibName: "UserTableViewCell", bundle: nil), forCellReuseIdentifier: "UserTableViewCell")
    }
}

extension ContentViewController : UITableViewDelegate, UITableViewDataSource, UsersViewModelDelegate {
        func onSuccessfullMoviesLoaded() {
            self.userTableView.reloadData()
        }
    
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

