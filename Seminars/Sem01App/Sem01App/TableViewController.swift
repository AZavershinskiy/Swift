//
//  TableViewController.swift
//  Sem01App
//
//  Created by Andrey Zavershinskiy on 29.09.2023.
//

import UIKit

class TableViewController: UITableViewController {
	
	override func numberOfSections(in tableView: UITableView) -> Int {
		3
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		5
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		TableViewCell()
	}
}
