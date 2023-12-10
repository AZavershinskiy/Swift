//
//  DateConverter.swift
//  HW_05
//
//  Created by Andrey Zavershinskiy on 04.12.2023.
//

import Foundation

final class DateConverter {
	
	func dateConvert(timeInterval: Int) -> String {
		let publicationDate = Date(timeIntervalSince1970: TimeInterval(timeInterval))
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "HH:mm - d MMMM yyyy"
		dateFormatter.locale = Locale(identifier: "ru_RU")
		return dateFormatter.string(from: publicationDate)
	}
	
}
