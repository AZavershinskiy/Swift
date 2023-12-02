//
//  FriendViewController.swift
//  HW_01p1
//
//  Created by Andrey Zavershinskiy on 16.11.2023.
//

import UIKit

final class FriendsViewController: UITableViewController {
	private var friends = [Friend]()
	
	private var profileView = ProfileViewController()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		title = "Friends"
		
		let buttonItem = UIBarButtonItem(image: UIImage(systemName: "person"), style: .plain, target: self, action: #selector(goToProfileViewController))
		//		navigationController?.navigationBar.topItem?.setRightBarButton(buttonItem, animated: true)
		navigationItem.rightBarButtonItem = buttonItem
		
		tableView.register(FriendCell.self, forCellReuseIdentifier: Constants.Identifier.photoCellIdentifier)
		NetworkService().getFriends{ [weak self] friends in
			self?.friends = friends
			DispatchQueue.main.async {
				self?.tableView.reloadData()
			}
		}
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		friends.count
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Identifier.photoCellIdentifier, for: indexPath) as? FriendCell else { return UITableViewCell() }
		cell.updateCell(model: friends[indexPath.row])
		return cell
	}
}


private extension FriendsViewController {
	
	@objc func goToProfileViewController() {
		let animation = CATransition()
		animation.type = .fade
		animation.duration = 0.5
		navigationController?.view.layer.add(animation, forKey: nil)
		
		navigationController?.pushViewController(ProfileViewController(), animated: false)
	}
}
