//
//  Date+Extension.swift
//  Earthquakes
//
//  Created by Ludovic HENRY on 01/06/2024.
//

import Foundation

extension Date {
    static func dateCreator(year: Int, month: Int, day: Int) -> Date {
        var component: DateComponents = DateComponents()
        component.calendar = .current
        component.year = year
        component.month = month
        component.day = day
        return Calendar.current.date(from: component)!
    }

    func timeAgo() -> String {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .abbreviated
        return formatter.localizedString(for: self, relativeTo: Date())
    }

    func toString() -> String {
        let formater = DateFormatter()
        formater.dateStyle = .short
        formater.timeStyle = .short
        return formater.string(from: self)
    }

}
