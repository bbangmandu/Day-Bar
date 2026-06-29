//
//  AnniversaryListView.swift
//  DayBar
//
//  Created by BBangMandu on 6/29/26.
//

import SwiftUI

struct AnniversaryListView: View {

    let dday: DDay

    var body: some View {

        ScrollView {

            LazyVStack {

                ForEach(
                    anniversaries(from: dday)
                ) { item in

                    HStack {

                        Text(item.title)

                        Spacer()

                        Text(item.date.ddayFormatted)
                    }
                }
            }
        }
        .frame(height: 100)
    }
}

extension AnniversaryListView {

    func anniversaries(
        from dday: DDay
    ) -> [AnniversaryItem] {

        let calendar = Calendar.current
        var items: [AnniversaryItem] = []

        for day in stride(
            from: 100,
            through: 10000,
            by: 100
        ) {

            items.append(
                AnniversaryItem(
                    title: "\(day)일",
                    date: calendar.date(
                        byAdding: .day,
                        value: day - 1,
                        to: dday.date
                    )!
                )
            )
        }

        for year in 1...30 {

            items.append(
                AnniversaryItem(
                    title: "\(year)주년",
                    date: calendar.date(
                        byAdding: .year,
                        value: year,
                        to: dday.date
                    )!
                )
            )
        }

        return items.sorted {
            $0.date < $1.date
        }
    }
}
