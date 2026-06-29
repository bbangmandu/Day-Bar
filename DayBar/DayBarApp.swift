//
//  DayBarApp.swift
//  D-Day Tracker MacOS Application
//
//  Created by BBangMandu on 6/25/26.
//

import SwiftUI

@main
struct DayBarApp: App {

    @StateObject
    private var store = DDayStore()

    var body: some Scene {
        
        MenuBarExtra {

            MenuBarView(
                store: store
            )

        } label: {

            if let dday = store.dday {

                switch store.menuBarStyle {

                case .count:

                    Text("\(dday.currentDayCount)")

                case .emoji:

                    Text(dday.emoji)

                case .emojiAndCount:

                    Text("\(dday.emoji) \(dday.currentDayCount)")

                case .titleAndCount:

                    Text("\(dday.title) + \(dday.currentDayCount)")
                }

            } else {

                Text("D-DAY")
            }
        }
        .menuBarExtraStyle(.window)
    }
}
