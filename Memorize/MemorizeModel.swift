//
//  MemorizeModel.swift
//  Memorize
//
//  Created by dengweidong on 2022/1/12.
//

import Foundation
import SwiftUI

struct MemoryGame<CardContent> where CardContent: Equatable {
    
    struct Card: Identifiable {
        var content: CardContent
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var id: Int
    }
    
    var cards: Array<Card>
    var theme: Theme<CardContent>
    var indexOfFaceUpCard: Int?
    
    init(theme: Theme<CardContent>) {
        self.theme = theme
        self.cards = Array<Card>()
        for index in 0..<theme.pairsOfCards {
            self.cards.append(Card(content: theme.emojis[index], id: index*2))
            self.cards.append(Card(content: theme.emojis[index], id: index*2+1))
        }
    }
    
    mutating func choose(card: Card) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id}) { // firstIndex返回值是optional
            if let potentialMatchedIndex = indexOfFaceUpCard {
                if cards[potentialMatchedIndex].content == cards[chosenIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchedIndex].isMatched = true
                }
                indexOfFaceUpCard = nil
            } else {
                for index in cards.indices {
                    cards[index].isFaceUp = false
                }
                indexOfFaceUpCard = chosenIndex
            }
            cards[chosenIndex].isFaceUp.toggle()
        }
    }
}

struct Theme<CardContent> {
    var name: String
    var emojis: Array<CardContent>
    var pairsOfCards: Int
    var color: String
}
