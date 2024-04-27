//
//  CardView.swift
//  Lab2
//
//  Created by student on 27/04/2024.
//

import SwiftUI

struct CardView: View {
    @State var emoji: String
    @Binding var themeColor: Color
    @State var isHidden: Bool = false
    
    var body: some View {
        ZStack{
        RoundedRectangle(cornerRadius: 12)
                .fill(themeColor)
            Group{
                RoundedRectangle(cornerRadius: 12)
                    .fill(.white)
                    .strokeBorder(lineWidth: 2)
                Text(emoji)
                    .font(.largeTitle)
            }
            .opacity(isHidden ? 1.0 : 0.0)
        }
        .onTapGesture {isHidden = !isHidden}
    }
}

