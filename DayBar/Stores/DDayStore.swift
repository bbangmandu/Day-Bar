//
//  DDayStore.swift
//  DayBar
//
//  Created by BBangMandu on 6/25/26.
//

import Foundation
import Combine

@MainActor
final class DDayStore: ObservableObject {
    
    private let ddaykey = "saved_dday"
    private let menubarstylekey = "saved_menu_barstyle"
    
    @Published var dday: DDay? {
        didSet {
            persistDDay()
        }
    }
    
    @Published
    var menuBarStyle: MenuBarStyle = .titleAndCount {
        didSet {
            UserDefaults.standard.set(
                menuBarStyle.rawValue,
                forKey: menubarstylekey
            )
        }
    }
    
    init() {
        load()
    }
    
    func save(
        title: String,
        emoji: String,
        date: Date
    ) {
        
        dday = DDay(
            title: title,
            emoji: emoji,
            date: date
        )
        
    }
    
    func delete() {
        dday = nil
    }
    
    private func persistDDay() {
        guard let dday else {
            UserDefaults.standard.removeObject(
                forKey: ddaykey
            )
            return
        }
        
        if let data = try? JSONEncoder().encode(dday) {
            UserDefaults.standard.set(
                data,
                forKey: ddaykey
            )
        }
    }
    
    private func load() {
        
        if let data = UserDefaults.standard.data(
            forKey: ddaykey
        ),
           let savedDDay = try? JSONDecoder().decode(
            DDay.self,
            from: data
           ) {
            
            dday = savedDDay
        }
        
        if let rawValue = UserDefaults.standard.string(
            forKey: menubarstylekey
        ),
           
           let style = MenuBarStyle(rawValue: rawValue) {
            
            menuBarStyle = style
        }
    }
    
}
