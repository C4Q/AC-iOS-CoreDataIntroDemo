//
//  CreatePostTableViewController.swift
//  NumberFacts
//
//  Created by C4Q  on 2/5/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class CreatePostTableViewController: UITableViewController {
    
    var users = [User]() {
        didSet {
            userPickerView.reloadComponent(0)
        }
    }
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var userPickerView: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userPickerView.delegate = self
        userPickerView.dataSource = self
        loadUsers()
    }
    
    func loadUsers() {
        do {
            let moc = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            users = try moc.fetch(User.fetchRequest())
        }
        catch {
            print(error)
        }
    }
    
    @IBAction func submitButtonPressed(_ sender: Any) {
        //Get the title, number and user
        //TO DO: Validate input
        let newPostTitle = titleTextField.text!
        let newPostNumber = Double(numberTextField.text!)!
        let newPostUser = users[userPickerView.selectedRow(inComponent: 0)]
        //Create a new post with the above info and save it
        let newPost = Post(title: newPostTitle, number: newPostNumber, user: newPostUser)
        //Alert of the user
        let successAlert = UIAlertController(title: "Success", message: "New post created: \(newPost.title ?? "No title")", preferredStyle: .alert)
        successAlert.addAction(UIAlertAction(title: "Continue", style: .default, handler: nil))
        present(successAlert, animated: true , completion: nil)
    }
}

extension CreatePostTableViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let user = users[row]
        return user.name
    }
}

extension CreatePostTableViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return users.count
    }
}
