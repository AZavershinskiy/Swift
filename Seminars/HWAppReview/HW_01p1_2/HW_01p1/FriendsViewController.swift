//
//  FriendViewController.swift
//  HW_01p1
//
//  Created by Andrey Zavershinskiy on 16.11.2023.
//

import UIKit

final class FriendsViewController: UITableViewController {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		title = "Friends"
		view.backgroundColor = .white
		tableView.backgroundColor = .white
		navigationController?.navigationBar.tintColor = .black
		navigationController?.navigationBar.barTintColor = .white
		NetworkService().getFriends()
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		5
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		FriendCell()
	}
}
