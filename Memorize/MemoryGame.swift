//
//  MemoryGame.swift
//  Memorize
//
//  Created by dengweidong on 2022/1/5.
//

// Model

import Foundation  // basic structs, Array String Dictionary

// 卡面可能是字符串 可能是图片 可能是其他 所以用泛型
struct MemoryGame<CardContent> {
    private(set) var cards: Array<Card>  // 可读不可写
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }
    
    func choose(_ card: Card) {
        
    }
    
    struct Card {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
    }
}
