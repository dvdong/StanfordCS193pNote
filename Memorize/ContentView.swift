//
//  ContentView.swift
//  Memorize
//
//  Created by dengweidong on 2021/12/16.
//

// Assignment1

import SwiftUI

struct ContentView: View { // behaves like a View
    // 声明数组 三种类型表示
    var emojis = ["🛴","🚆","✈️","🚃","🚝","🚂","🚒","🏎","🚨","💺","🛰","🚀","🚁","⛵️","⚓️","🛶","⛽️","💺","🛸"]
    
    @State var emojiCount: Int = 15
    
    var body: some View {
        VStack {
            Text("Memorize!").font(.largeTitle)
            Spacer()
            ScrollView {
                LazyVGrid(columns:[GridItem(.adaptive(minimum: 65))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(content:emoji).aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.red)
        }
    }
}

struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                // 两个圆角矩形重叠 实现填充色和边框
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }.onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
//        ContentView()
//            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.light)
    }
}
