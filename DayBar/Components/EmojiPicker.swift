//
//  EmojiPicker.swift
//  DayBar
//
//  Created by BBangMandu on 6/29/26.
//

import SwiftUI

struct EmojiPicker: View {
    
    @Binding var selectedEmoji: String
    
    let onSelect: () -> Void
    
    private let emojis = [
        "❤️", "🩷", "🧡", "💛", "💚", "🩵", "💙", "💜", "🤎", "🖤", "🩶", "🤍",
        
        "💕", "💖", "💗", "💘", "💝", "💞", "💓", "💟", "❣️", "❤️‍🔥", "❤️‍🩹",
        
        "💑", "👩‍❤️‍👨", "👨‍❤️‍👨", "👩‍❤️‍👩",
        
        "💋", "😘", "🥰", "😍",
        
        "💍", "🌹", "🌷", "🌸", "🫶"
    ]
    
    var body: some View {
        
        LazyVGrid(
            columns: Array(
                repeating: GridItem(.flexible()),
                count: 5
            )
        ) {
            
            ForEach(emojis, id: \.self) { emoji in
                
                Button(emoji) {
                    
                    selectedEmoji = emoji
                    onSelect()
                }
                .buttonStyle(.plain)
            }
        }
        .padding()
    }
}
