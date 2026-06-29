//
//  MenuBarView.swift
//  DayBar
//
//  Created by BBangMandu on 6/25/26.
//

import SwiftUI

enum Screen {
    case main
    case add
}

struct MenuBarView: View {

    let store: DDayStore

    @State private var screen: Screen = .main

    var body: some View {

        switch screen {

        case .main:

            MainView(
                store: store,
                onAddOrEdit: {
                    screen = .add
                }
            )

        case .add:

            AddView(
                store: store,
                onBack: {
                    screen = .main
                }
            )
        }
    }
}
