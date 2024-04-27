//
//  ContentView.swift
//  Lab2
//
//  Created by student on 27/04/2024.
//

import SwiftUI

struct ContentView: View {
    @State var emojis: [[String]] = [
                                    ["🚔", "🛩️", "😁", "😍", "😝", "📸", "😇", "😅", "🚨", "♐️", "🔎"],
                                    ["😇", "😅", "🚨", "♐️", "🔎", "🥁", "🍊", "🍋", "🍌", "🍉", "🍇"],
                                    ["🚗", "🚕", "🚙", "😍", "😝", "📸", "😇", "🍊", "🍋", "🍌", "🍉"]
                                    ]
    @State var currentEmojiSet: Int = 0
    @State var themeColor: Color = .blue
    @State var cardCount: Int = 4
    
    var cardDisplay: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 80)), GridItem(.adaptive(minimum: 80))])
            {
                ForEach(emojis[currentEmojiSet].prefix(cardCount), id:\.self){
                    CardView(emoji: $0, themeColor: $themeColor).aspectRatio(CGSize(width: 2, height: 3), contentMode: .fit)
                }
            }.foregroundColor(themeColor)
        }
    }
    
    func adjustCardNumber(by offset: Int, symbol: String) -> some View{
        let disabled = cardCount + offset  > emojis[currentEmojiSet].count || cardCount + offset <= 2
        return Button(action: {cardCount += offset}, label: {
            Image(systemName: symbol)
        }).disabled(disabled)
    }
    
    var removeCards: some View{
        return adjustCardNumber(by: -2, symbol: "minus")
    }
    
    var addCards: some View{
        return adjustCardNumber(by: 2, symbol:"plus")
    }
    
    var body: some View {
        VStack {
            Text("Memo").font(.largeTitle)
            cardDisplay
            HStack {
                removeCards
                Spacer()
                addCards
            }.padding(15)
            ThemeIconView(emojis: $emojis, currentEmojiSet: $currentEmojiSet, themeColor: $themeColor).foregroundColor(themeColor)
        }
    }
}
