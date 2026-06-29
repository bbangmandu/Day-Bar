//
//  DDay.swift
//  D-Day Basic Structure.
//
//  Created by BBangMandu on 6/25/26.
//

import Foundation

struct DDay: Codable {
    let title: String
    let emoji: String
    let date: Date
    
    var currentDayCount: Int {

        let days = Calendar.current.dateComponents(
            [.day],
            from: date,
            to: Date()
        ).day ?? 0

        return days + 1
    }
}

struct AnniversaryItem: Identifiable {

    let id = UUID()

    let title: String
    let date: Date
}

extension DDay {

    var daysPassed: Int {

        Calendar.current.dateComponents(
            [.day],
            from: date,
            to: Date()
        ).day! + 1
    }

    var formattedDate: String {

        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy.MM.dd"

        return formatter.string(from: date)
    }
}


enum MenuBarStyle: String, Codable, CaseIterable {
    case count
    case emoji
    case emojiAndCount
    case titleAndCount
    
    var title: String {
        
        switch self {
        case .count:
            return "숫자"
            
        case .emoji:
            return "이모지"
            
        case .emojiAndCount:
            return "이모지 + 숫자"
    
        case .titleAndCount:
            return "타이틀 + 숫자"
        }
    }
}
