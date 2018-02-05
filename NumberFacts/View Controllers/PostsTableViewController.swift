//
//  PostsTableViewController.swift
//  NumberFacts
//
//  Created by C4Q  on 2/5/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class PostsTableViewController: UITableViewController {

    var user: User?
    
    var posts = [Post]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadPosts()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadPosts()
    }

    func loadPosts() {
        if let passedInUser = user {
            guard let userPosts = passedInUser.posts?.allObjects as? [Post] else {return}
            posts = userPosts
        } else {
            CoreDataHelper.manager.getPosts{posts = $0}
        }
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath)
        let post = posts[indexPath.row]
        cell.textLabel?.text = "\(post.user?.name ?? "Unknown") - \(post.title ?? "No content")"
        cell.detailTextLabel?.text = "\(post.number)"
        return cell
    }
}
