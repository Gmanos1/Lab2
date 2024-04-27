//
//  ThemeIconView.swift
//  Lab2
//
//  Created by student on 27/04/2024.
//
import SwiftUI

struct ThemeIconView: View {
    @Binding var emojis: [[String]]
    @Binding var currentEmojiSet: Int
    @Binding var themeColor: Color
    
    var body: some View {
        HStack {
            Spacer()
            ThemeIcon(symbol: "smiley", caption: "Smile", emojiSet: 0, color: .blue)
            Spacer()
            ThemeIcon(symbol: "applelogo", caption: "Fruit", emojiSet: 1, color: .yellow)
            Spacer()
            ThemeIcon(symbol: "car.rear", caption: "Car", emojiSet: 2, color: .red)
            Spacer()
        }
    }
    
    func ThemeIcon(symbol: String, caption: String, emojiSet: Int, color: Color) -> some View {
        Button(action: {
            emojis[currentEmojiSet] = emojis[currentEmojiSet].shuffled()
            themeColor = color
        }, label: {
            VStack {
                Image(systemName: symbol).font(.largeTitle)
                Text(caption)
            }
        })
    }
}
