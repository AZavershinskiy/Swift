//
//  GroupsViewController.swift
//  HW_01p1
//
//  Created by Andrey Zavershinskiy on 16.11.2023.
//
// MARK: - Group List Controller settings

import UIKit

final class GroupsViewController: UITableViewController {

	private var groups = [Group]()
	private var networkService = NetworkService()
	private var dataService = DataService()
	private var dateConverter = DateConverter()

	override func viewDidLoad() {
		super.viewDidLoad()
		title = "Groups"
//		groups = dataService.getGroups()
		updateList()
		tableView.register(GroupCell.self, forCellReuseIdentifier: Constants.Identifier.photoCellIdentifier)
		refreshControl = UIRefreshControl()
		refreshControl?.addTarget(self, action: #selector(updateList), for: .valueChanged)
	}

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		updateColor()
		tableView.reloadData()
	}

	// MARK: - Apply theme settings
	private func updateColor() {
		tableView.backgroundColor = Theme.currentTheme.backroundColor
		navigationController?.navigationBar.tintColor = Theme.currentTheme.textColor
		navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: Theme.currentTheme.textColor]
		navigationController?.tabBarItem.setTitleTextAttributes([.foregroundColor: Theme.currentTheme.textColor as UIColor], for: .normal)
	}

	// MARK: - Amount of lines
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		groups.count
	}

	// MARK: - Displaying elements in a cell
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Identifier.photoCellIdentifier, for: indexPath) as? GroupCell else { return UITableViewCell() }
		cell.updateCell(model: groups[indexPath.row])
		return cell
	}

	// MARK: - Alert settings for date display
	private func showAlert() {
		let date = dataService.getGroupsDate() == Date(timeIntervalSince1970: 0) ? "No data" : "Data is current as of \(dateConverter.dateInString(date: dataService.getGroupsDate()))"
		let alert = UIAlertController(title: "Data update error", message: date, preferredStyle: .alert)
		alert.addAction(UIAlertAction(title: "Close", style: .default))
		present(alert, animated: true)
	}

}

// MARK: - @objc methods
private extension GroupsViewController {

	/// Method for updating the Group List
	@objc func updateList() {
		networkService.getGroups { [weak self] result in
			switch result {
				case .success(let groups):
					self?.groups = groups
					self?.dataService.addGroups(groups: groups)
					DispatchQueue.main.async {
						self?.tableView.reloadData()
					}
				case .failure:
					self?.groups = self?.dataService.getGroups() ?? []
					DispatchQueue.main.async {
						self?.showAlert()
					}
			}
			DispatchQueue.main.async {
				self?.refreshControl?.endRefreshing()
			}
		}
	}
}
