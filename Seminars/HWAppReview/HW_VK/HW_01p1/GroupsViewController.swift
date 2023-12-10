//
//  GroupsViewController.swift
//  HW_01p1
//
//  Created by Andrey Zavershinskiy on 16.11.2023.
//

import UIKit

final class GroupsViewController: UITableViewController {
	private var groups = [Group]()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		title = "Groups"
		
		tableView.register(GroupCell.self, forCellReuseIdentifier: Constants.Identifier.photoCellIdentifier)
		NetworkService().getGroups{ [weak self] groups in
			self?.groups = groups
			DispatchQueue.main.async {
				self?.tableView.reloadData()
			}
		}
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		updateColor()
		tableView.reloadData()
	}
	
	private func updateColor() {
		tableView.backgroundColor = Theme.currentTheme.backroundColor
		navigationController?.navigationBar.tintColor = Theme.currentTheme.textColor
		navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: Theme.currentTheme.textColor]
		navigationController?.tabBarItem.setTitleTextAttributes([.foregroundColor: Theme.currentTheme.textColor as UIColor], for: .normal)
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		groups.count
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Identifier.photoCellIdentifier, for: indexPath) as? GroupCell else { return UITableViewCell() }
		cell.updateCell(model: groups[indexPath.row])
		return cell
	}
}
