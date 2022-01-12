//
//  ContentView.swift
//  Memorize
//
//  Created by dengweidong on 2021/12/16.
//

// Assignment1

import SwiftUI

struct ContentView: View { // behaves like a View
    
    @ObservedObject var viewModel: EmojiMemoryGame
    var color: Color {
        switch viewModel.flagTheme.color {
            case "red": return Color.red
            default: return Color.blue
        }
    }
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 75))]) {
                    ForEach(viewModel.cards) { card in
                        CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                viewModel.choose(card)
                            }
                    }
                }.foregroundColor(color)
            }.padding(.horizontal)
        }
    }
}

struct CardView: View {
    
    let card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if card.isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content).font(.largeTitle)
            } else if card.isMatched {
                shape.opacity(0)
            } else {
                shape.fill()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = EmojiMemoryGame(theme: "flag", pairOfCards: 6)
        ContentView(viewModel: viewModel)
            .previewInterfaceOrientation(.portrait)
    }
}
