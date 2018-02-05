//
//  CreateUserTableViewController.swift
//  NumberFacts
//
//  Created by C4Q  on 2/5/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit


class CreateUserTableViewController: UITableViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func submitButtonPressed(_ sender: Any) {
        //Get Name and DOB
        //TO DO: Validate inputs
        let userName = nameTextField.text!
        let dob = datePicker.date
        //Create and save new User
        let newUser = User(name: userName, dob: dob)
        //Alert the user
        let successAlert = UIAlertController(title: "Success", message: "User: \(newUser.name ?? "no name") saved", preferredStyle: .alert)
        successAlert.addAction(UIAlertAction(title: "Continue", style: .default, handler: nil))
        present(successAlert, animated: true, completion: nil)
    }
}
