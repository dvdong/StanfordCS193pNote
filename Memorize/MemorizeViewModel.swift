//
//  MemorizeViewModel.swift
//  Memorize
//
//  Created by dengweidong on 2022/1/12.
//

import Foundation

class EmojiMemoryGame: ObservableObject {
    
    static let vehicles:[String] = ["🛴","🚆","✈️","🚃","🚝","🚂","🚒","🏎","🚨","💺","🛰","🚀"]
    static let animals:[String] = ["🐶","🐰","🐷","🐵","🐸","🐼","🦉","🐴","🐢","🐞"]
    
    var flagTheme: Theme<String>
    @Published private var model: MemoryGame<String>
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    init(theme: String, pairOfCards: Int) {
        let flags:[String] = ["🏳️","🏴‍☠️","🏳️‍🌈","🇺🇳","🇦🇷","🇴🇲","🇦🇹","🇦🇺","🇦🇴","🇧🇸","🇧🇯","🇲🇰"]
        flagTheme = Theme<String>(name: theme, emojis: flags, pairsOfCards: pairOfCards, color: "Red")
        model = MemoryGame<String>(theme: self.flagTheme)
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}
