//
//  MainView.swift
//  DayBar
//
//  Created by BBangMandu on 6/29/26.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject
    var store: DDayStore
    
    let onAddOrEdit: () -> Void
    
    var body: some View {
        
        if let dday = store.dday {
            
            VStack(alignment: .leading) {
                
                HStack(alignment: .center) {
                    Text("\(dday.emoji) \(dday.title)")
                        .font(.headline)
                    
                    Spacer()
                    
                    Text(dday.date.ddayFormatted)
                }
                
                Divider()
                
                HStack(alignment: .center) {
                    Picker(
                        "Styles",
                        selection: $store.menuBarStyle,
                    ) {
                        
                        ForEach(
                            MenuBarStyle.allCases,
                            id: \.self
                        ) { style in
                            Text(style.title).tag(style)
                        }
                    }
                    .labelsHidden()
                    
                    Spacer()
                    
                    Button("Edit") {
                        onAddOrEdit()
                    }
                }
                
                Divider()
                
                AnniversaryListView(
                    dday: dday
                )
                
                Divider()

                Button("Exit") {
                    NSApplication.shared.terminate(nil)
                }
            }
            .padding()
            .frame(width: 250)
        } else {
            
            VStack {
                
                Spacer()
                
                Button("Add") {
                    onAddOrEdit()
                }
                
                Spacer()
            }
        }
    }
}
