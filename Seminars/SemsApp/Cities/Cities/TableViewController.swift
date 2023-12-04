//
//  TableViewController.swift
//  Cities
//
//  Created by Daniil Rassadin on 16/11/23.
//

import UIKit

class TableViewController: UITableViewController, NetworkServiceDelegate {
    private let networkService = NetworkService()
    private var cities = [City]()
    private let userDefaultService = UserDefaultsService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        networkService.delegate = self
        tableView.register(
            CustomTableViewCell.self,
            forCellReuseIdentifier: CustomTableViewCell.identifier
        )
        cities = userDefaultService.get()
        networkService.fetchData()
//        networkService.fetchData { [weak self] cities in
//            self?.cities = cities
//            DispatchQueue.main.async {
//                self?.tableView.reloadData()
//            }
//        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.backgroundColor = Theme.currentTheme.backgroundColor
    }
    
    func updateCities(cities: [City]) {
        self.cities = cities
        userDefaultService.save(cities: cities)
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cities.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: CustomTableViewCell.identifier,
            for: indexPath
        ) as? CustomTableViewCell else {
            return UITableViewCell()
        }
        cell.configureCell(city: cities[indexPath.row])
        return cell
    }
}
