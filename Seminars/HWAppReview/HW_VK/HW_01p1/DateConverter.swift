//
//  DateConverter.swift
//  HW_01p1
//
//  Created by Andrey Zavershinskiy on 12.12.2023.
//

import Foundation

final class DateConverter {
	
	func dateInString(date: Date) -> String {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "HH:mm - d MMMM yyyy"
		dateFormatter.locale = Locale(identifier: "ru_RU")
		return dateFormatter.string(from: date)
	}
}
