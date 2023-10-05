//
//  TableViewController.swift
//  CreateApp
//
//  Created by Анастасия Рябова on 27.04.2023.
//

import UIKit

class TableViewController: UITableViewController {
    
    private var networkService = NetworkService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
		
        view.backgroundColor = .white
        tableView.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.barTintColor = .white
        
//        networkService.getData()
//		networkService.getCat(with: 404)
//        networkService.getNews()
//        networkService.getPlaces()
        networkService.getMovies()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        CustomTableViewCell()
    }
}
