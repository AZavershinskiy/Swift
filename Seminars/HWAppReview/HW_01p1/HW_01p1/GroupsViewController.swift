//
//  GroupsViewController.swift
//  HW_01p1
//
//  Created by Andrey Zavershinskiy on 16.11.2023.
//

import UIKit

final class GroupsViewController: UITableViewController {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		title = "Groups"
		view.backgroundColor = .white
		tableView.backgroundColor = .white
		navigationController?.navigationBar.tintColor = .black
		navigationController?.navigationBar.barTintColor = .white
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		5
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		GroupCell()
	}
}

#Preview {
	GroupsViewController()
}
