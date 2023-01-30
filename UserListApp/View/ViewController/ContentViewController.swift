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
    
    
    var viewModel = UserListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        userTableView.delegate = self
        userTableView.dataSource = self
        viewModel.restapiRead(tableView: userTableView)
    }
    
    func configure(){
        userTableView.register(UINib(nibName: "UserTableViewCell", bundle: nil), forCellReuseIdentifier: "UserTableViewCell")
    }
}
