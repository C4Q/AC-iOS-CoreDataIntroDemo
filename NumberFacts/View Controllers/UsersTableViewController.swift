//
//  UsersTableViewController.swift
//  NumberFacts
//
//  Created by C4Q  on 2/5/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class UsersTableViewController: UITableViewController {

    var users = [User]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadUsers()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadUsers()
    }
    
    func loadUsers() {
        CoreDataHelper.manager.getUsers{users = $0}
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath)
        let user = users[indexPath.row]
        cell.textLabel?.text = user.name
        //TO DO: Add DOB info
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let id = segue.identifier {
            switch id {
            case "viewPosts":
                guard let destination = segue.destination as? PostsTableViewController else { return }
                let selectedUser = users[tableView.indexPathForSelectedRow!.row]
                destination.user = selectedUser
            default:
                break
            }
        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
}
