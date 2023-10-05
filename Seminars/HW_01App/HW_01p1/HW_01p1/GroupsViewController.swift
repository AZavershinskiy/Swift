//
//  GroupsViewController.swift
//  HW_01p1
//
//  Created by Andrey Zavershinskiy on 02.10.2023.
//

import UIKit

final class GroupsViewController: UITableViewController {
	
	private let networkService = NetworkService()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		title = "Groups"
		view.backgroundColor = .white
		tableView.backgroundColor = .white
		navigationController?.navigationBar.tintColor = .black
		navigationController?.navigationBar.barTintColor = .white
		
		networkService.getGroups()
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		5
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		GroupCell()
	}
}
