//
//  FriendViewController.swift
//  HW_01p1
//
//  Created by Andrey Zavershinskiy on 16.11.2023.
//
// MARK: - Friend List Controller settings

import UIKit

protocol FriendsViewControllerProtocol: AnyObject {
	func updateList()
}

final class FriendsViewController: UITableViewController, FriendsViewControllerProtocol {

	private var friends = [Friend]()
	private var networkService = NetworkService()
	private var dataService = DataService()
	private var dateConverter = DateConverter()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		title = "Friends"
//		friends = dataService.getFriends()
		updateColor()
		navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person"), style: .plain, target: self, action: #selector(goToProfileViewController))
		tableView.register(FriendCell.self, forCellReuseIdentifier: Constants.Identifier.photoCellIdentifier)
		refreshControl = UIRefreshControl()
		refreshControl?.addTarget(self, action: #selector(updateList), for: .valueChanged)
	}

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		tabBarController?.tabBar.isHidden = false
		updateList()
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
		friends.count
	}

	// MARK: - Displaying elements in a cell
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Identifier.photoCellIdentifier, for: indexPath) as? FriendCell else { return UITableViewCell()
		}
		cell.updateCell(model: friends[indexPath.row])
		cell.tap = { [weak self] fullName, photo in
			self?.navigationController?.pushViewController(ProfileViewController(isUserProfile: false, photo: photo, fullName: fullName), animated: true)
		}
		return cell
	}

	// MARK: - Alert settings for date display
	private func showAlert() {
		let date = dataService.getFriendsDate() == Date(timeIntervalSince1970: 0) ? "No data" : "Data is current as of \(dateConverter.dateInString(date: dataService.getFriendsDate()))"
		let alert = UIAlertController(title: "Data update error", message: date, preferredStyle: .alert)
		print(alert)
		alert.addAction(UIAlertAction(title: "Close", style: .default))
		present(alert, animated: true)
	}
}

// MARK: - @objc methods
extension FriendsViewController {

	/// Method of transitions to User Profile
	@objc func goToProfileViewController() {
		let animation = CATransition()
		animation.type = .fade
		animation.duration = 0.5
		navigationController?.view.layer.add(animation, forKey: nil)
		navigationController?.pushViewController(ProfileViewController(isUserProfile: true), animated: false)
	}

	// MARK: Method for updating the Friend List
	@objc func updateList() {
		networkService.getFriends { [weak self] result in
			switch result {
				case .success(let friends):
					self?.friends = friends
					self?.dataService.addFriends(friends: friends)
					DispatchQueue.main.async {
						self?.tableView.reloadData()
					}
				case .failure:
					self?.friends = self?.dataService.getFriends() ?? []
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
