//
//  DateConverter.swift
//  HW_01p1
//
//  Created by Andrey Zavershinskiy on 12.12.2023.
//
// MARK: - Convert Date to readable form

import Foundation

final class DateConverter {
	/// Method for converting a Date from an Interval to a String
	/// - Parameter date: Incoming Date Argument in interval format (timeIntervalSince1970)
	/// - Returns: Date after conversion to String
	func dateInString(date: Date) -> String {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "HH:mm - d MMMM yyyy"
		dateFormatter.locale = Locale(identifier: "ru_RU")
		return dateFormatter.string(from: date)
	}
}
