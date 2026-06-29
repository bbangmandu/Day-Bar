//
//  DateFormat.swift
//  DayBar
//
//  Created by BBangMandu on 6/29/26.
//

import Foundation

extension Date {

    var ddayFormatted: String {

        let formatter = DateFormatter()

        formatter.dateFormat = "yyyy년 MM월 dd일"

        return formatter.string(from: self)
    }
}
