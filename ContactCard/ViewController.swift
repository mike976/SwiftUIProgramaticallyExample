//
//  ViewController.swift
//  ContactCard
//
//  Created by Michael Bullock on 27/04/2020.
//  Copyright © 2020 Michael Bullock. All rights reserved.
//

import UIKit
import PureLayout

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    lazy var profileView: UIView = {
        return ProfileView(tableView: self.tableView)
    }()
    
    let profileInfoCellReuseIdentifier = "profileInfoCellReuseIdentifier"
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(ProfileInfoTableViewCell.self, forCellReuseIdentifier: profileInfoCellReuseIdentifier)
        tableView.rowHeight = 68
        
        //recalculates the row height based on its cell content
        tableView.estimatedRowHeight = 64
        tableView.rowHeight = UITableView.automaticDimension
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.isTranslucent = false
        self.title = "Michael Bullock"
        
        self.view.addSubview(self.profileView)
        self.profileView.autoPinEdgesToSuperviewEdges()
        self.view.layoutIfNeeded()
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    //MARK: - UITableViewDataSource methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: profileInfoCellReuseIdentifier, for: indexPath) as! ProfileInfoTableViewCell

        switch indexPath.row {
            case 0:
                cell.titleLabel.text = "Phone Number"
                cell.descriptionLabel.text = "+234567890"
            case 1:
                cell.titleLabel.text = "Email"
                cell.descriptionLabel.text = "john@doe.co"
            case 2:
                cell.titleLabel.text = "LinkedIn"
                cell.descriptionLabel.text = "www.linkedin.com/john-doe"
            case 3:
                cell.titleLabel.text = "Address"
                cell.descriptionLabel.text = "45, Walt Disney St.\n37485, Mickey Mouse State"
            default:
                break
            }

        return cell
    }
}







