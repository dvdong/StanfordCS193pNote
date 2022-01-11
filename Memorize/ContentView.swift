//
//  ContentView.swift
//  Memorize
//
//  Created by dengweidong on 2021/12/16.
//

// Assignment1

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: EmojiMemoryGame  // 由创建者传入
    
    var body: some View {
        ScrollView {
//            LazyVGrid(columns: [GridItem(GridItem.Size.adaptive(minimum: 1, maximum: 2))]) {
//
//            }
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 75))]) {
                ForEach(viewModel.cards) { card in
                    CardView(card:card)
                        .aspectRatio(2/3, contentMode: .fit)
                        .onTapGesture {
                            viewModel.choose(card)
                        }
                }
            }
        }
        .foregroundColor(.red)
        .padding(.horizontal)
    }
}

struct CardView: View {
    let card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if card.isFaceUp {
                // 两个圆角矩形重叠 实现填充色和边框
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content).font(.largeTitle)
            } else if card.isMatched {  // 当卡片匹配时 使其消失
                shape.opacity(0)
            }
            else {
                shape.fill()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()  // ViewModel
        ContentView(viewModel: game)
            .preferredColorScheme(.light)
    }
}
