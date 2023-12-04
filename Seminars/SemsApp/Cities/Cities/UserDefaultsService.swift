//
//  UserDefaultsService.swift
//  Cities
//
//  Created by Daniil Rassadin on 30/11/23.
//

import Foundation

final class UserDefaultsService {
    func save(cities: [City]) {
        for (i, city) in cities.enumerated() {
            UserDefaults.standard.set(city.name, forKey: "\(i)name")
            UserDefaults.standard.set(city.timezone, forKey: "\(i)timezone")
            UserDefaults.standard.set(city.coords.lat, forKey: "\(i)lat")
            UserDefaults.standard.set(city.coords.lon, forKey: "\(i)lon")
            UserDefaults.standard.set(city.currency, forKey: "\(i)currency")
        }
    }
    
    func get() -> [City] {
        var result = [City]()
        var isExist = UserDefaults.standard.string(forKey: "0name") != nil
        var i = 0
        
        while isExist {
            result.append(
                City(
                    name: UserDefaults.standard.string(forKey: "\(i)name") ?? "",
                    timezone: UserDefaults.standard.string(forKey: "\(i)timezone") ?? "",
                    coords: City.Coordinate(
                        lat: UserDefaults.standard.double(forKey: "\(i)lat"),
                        lon: UserDefaults.standard.double(forKey: "\(i)lon")
                    ),
                    currency: UserDefaults.standard.string(forKey: "\(i)currency") ?? ""
                )
            )
            i += 1
            isExist = UserDefaults.standard.string(forKey: "\(i)name") != nil
        }
        return result
    }
}
