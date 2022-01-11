//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by dengweidong on 2022/1/5.
//

// ViewModel it's part of UI

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    static let emojis = ["🛴","🚆","✈️","🚃","🚝","🚂","🚒","🏎","🚨","💺","🛰","🚀","🚁","⛵️","⚓️","🛶","⛽️","💺","🛸"]
    
    static func createMemoryGame(_ number: Int) -> MemoryGame<String> {
        // 调用model MemoryGame的init方法
        MemoryGame<String>(numberOfPairsOfCards: number) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    @Published private var model: MemoryGame<String> = createMemoryGame(9) // Swift能检测到struct的改变 但不能检测到class的改变
    
    var cards: Array<MemoryGame<String>.Card> {   // value is calculated so it's read only
        return model.cards
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
//        objectWillChange.send()
        model.choose(card)
    }
}
