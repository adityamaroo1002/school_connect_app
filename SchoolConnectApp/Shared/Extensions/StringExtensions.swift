//
//  StringExtensions.swift
//  SchoolConnectApp
//
//  Created by Aditya Maroo on 15/09/2026.
//

import Foundation

//MARK: - ------------------------------------------------
//MARK: - Date Extension Converting String to Formatted Time
extension String{
    func relativeTime()-> Self?{
        let formatters: [ISO8601DateFormatter] = [
            DateFormatters.isoFormatter,
            DateFormatters.isoFormatterWithFractionalSeconds
        ]
        
        guard let date = formatters.compactMap({
            $0.date(from: self)
        }).first else {
            return nil
        }
        return DateFormatters.relativeTime
            .localizedString(for: date, relativeTo: Date())
    }
}
