//
//  Date+Extension.swift
//  Earthquakes
//
//  Created by Ludovic HENRY on 01/06/2024.
//

import Foundation

extension Date {
    /// Quick creation of objects of type `Date`.
    /// - Parameters:
    ///   - year: The year that the `Date` must contain.
    ///   - month: The month that the `Date` must contain.
    ///   - day: The day that the `Date` must contain.
    /// - Returns: An instance of `Date` that includes the elements entered as a parameter.
    static func dateCreator(year: Int, month: Int, day: Int) -> Date {
        var component: DateComponents = DateComponents()
        component.calendar = .current
        component.year = year
        component.month = month
        component.day = day
        return Calendar.current.date(from: component)!
    }
    
    /// Give a text that contains the time that has elapsed between that date and now.
    /// - Returns: An abbreviated text `String` that includes the elapsed time.
    func timeAgo() -> String {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .abbreviated
        return formatter.localizedString(for: self, relativeTo: Date())
    }
    
    /// Gives a textual representation of this date.
    /// - Returns: An abbreviated text `String` that describe that date.
    func toString() -> String {
        let formater = DateFormatter()
        formater.dateStyle = .short
        formater.timeStyle = .short
        return formater.string(from: self)
    }
}
