//
//  DateExtensions.swift
//  SchoolConnectApp
//
//  Created by Aditya Maroo on 15/09/2026.
//

import Foundation

extension Date {
    
    var relativeTime: String {
        DateFormatters.relativeTime.localizedString(
            for: self,
            relativeTo: Date()
        )
    }
}
