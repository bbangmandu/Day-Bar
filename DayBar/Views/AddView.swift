//
//  AddView.swift
//  Add D-Day View.
//
//  Created by BBangMandu on 6/25/26.
//

import SwiftUI
import AppKit

struct AddView: View {

    let store: DDayStore
    let onBack: () -> Void

    @State private var title: String
    @State private var emoji: String

    @State private var year: Int
    @State private var month: Int
    @State private var day: Int

    @State private var showEmojiPicker = false

    init(
        store: DDayStore,
        onBack: @escaping () -> Void
    ) {
        self.store = store
        self.onBack = onBack

        let savedDate = store.dday?.date ?? Date()

        let components = Calendar.current.dateComponents(
            [.year, .month, .day],
            from: savedDate
        )

        _title = State(
            initialValue: store.dday?.title ?? ""
        )

        _emoji = State(
            initialValue: store.dday?.emoji ?? "♥️"
        )

        _year = State(
            initialValue: components.year ?? 2026
        )

        _month = State(
            initialValue: components.month ?? 1
        )

        _day = State(
            initialValue: components.day ?? 1
        )
    }

    var body: some View {

        VStack {

            HStack {

                Button("<") {
                    onBack()
                }

                Spacer()
            }

            HStack {

                Button(emoji) {
                    showEmojiPicker = true
                }
                .popover(isPresented: $showEmojiPicker) {

                    EmojiPicker(
                        selectedEmoji: $emoji
                    ) {
                        showEmojiPicker = false
                    }
                }

                TextField(
                    "Title",
                    text: Binding(
                        get: { title },
                        set: {
                            title = String($0.prefix(5))
                        }
                    )
                )
            }

            HStack {

                Picker("", selection: $year) {
                    ForEach(2000...2100, id: \.self) {
                        Text(String($0))
                    }
                }
                .pickerStyle(.menu)
                .frame(width: 90)

                Picker("", selection: $month) {
                    ForEach(1...12, id: \.self) {
                        Text("\($0)")
                    }
                }
                .pickerStyle(.menu)
                .frame(width: 60)

                Picker("", selection: $day) {
                    ForEach(1...31, id: \.self) {
                        Text("\($0)")
                    }
                }
                .pickerStyle(.menu)
                .frame(width: 60)
            }

            Spacer()

            HStack {

                Spacer()

                Button("Save") {

                    let date = Calendar.current.date(
                        from: DateComponents(
                            year: year,
                            month: month,
                            day: day
                        )
                    ) ?? Date()

                    store.save(
                        title: title,
                        emoji: emoji,
                        date: date
                    )

                    onBack()
                }
            }
        }
        .padding()
        .frame(width: 250, height: 150)
    }
}
