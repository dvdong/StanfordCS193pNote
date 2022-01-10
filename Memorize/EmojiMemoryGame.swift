//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by dengweidong on 2022/1/5.
//

// ViewModel it's part of UI

import SwiftUI

class EmojiMemoryGame {
    static let emojis = ["🛴","🚆","✈️","🚃","🚝","🚂","🚒","🏎","🚨","💺","🛰","🚀","🚁","⛵️","⚓️","🛶","⛽️","💺","🛸"]
    
    static func createMemoryGame(_ number: Int) -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: number) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    private var model: MemoryGame<String> = createMemoryGame(4)
    
    var cards: Array<MemoryGame<String>.Card> {   // value is calculated so it's read only
        return model.cards
    }
}
