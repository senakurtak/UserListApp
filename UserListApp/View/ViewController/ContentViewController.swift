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
    
    var userList = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        
        userTableView.delegate = self
        userTableView.dataSource = self
        restapiRead { [self] result in
           userList = result
            DispatchQueue.main.async {
                self.userTableView.reloadData()
            }
            
        }
    }
    
    func configure(){
        userTableView.register(UINib(nibName: "UserTableViewCell", bundle: nil), forCellReuseIdentifier: "UserTableViewCell")
    }
    
    
    func restapiRead(completion: @escaping ([User])-> Void){
        var request = URLRequest(url: URL(string: "https://reqres.in/api/users?page=1")!)
        request.httpMethod = "GET"
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            do {
//                print(response!)
                var result = try JSONDecoder().decode(Result.self, from: data!)
                completion(result.data)
            } catch {
                print("error")
            }
    
        })
        task.resume()
    }
}

extension ContentViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userList.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell", for: indexPath) as! UserTableViewCell
        cell.userEmail.text = userList[indexPath.row].email
        cell.userFirstName.text = userList[indexPath.row].firstName
        cell.userLastName.text = userList[indexPath.row].lastName
        let urlString = "\(userList[indexPath.row].avatar)"
        cell.userImage.sd_setImage(with: URL(string: urlString))
        return cell
    }
    
    
}
