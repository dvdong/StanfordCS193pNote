//
//  MemoryGame.swift
//  Memorize
//
//  Created by dengweidong on 2022/1/5.
//

// Model

import Foundation  // basic structs, Array String Dictionary

// 卡面可能是字符串 可能是图片 可能是其他 所以用泛型
struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>  // 对外界可读不可写
    
    private var indexOfTheOneAndOnlyFaceUpCard: Int?  // 标记唯一朝上的卡
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
    }
    
    // All arguments to functions are lets, they are constants
    mutating func choose(_ card: Card) {
        // 不对传进来的Card做修改，对自己的变量cards进行修改
//        if let chosenIndex = index(of: card)
        if let chosenIndex = cards.firstIndex(where: {$0.id == card.id}),  // Array的firsdIndex函数
           !cards[chosenIndex].isFaceUp,     // 使用if let时 ,表示&&
           !cards[chosenIndex].isMatched     // 面朝上的卡和已经匹配的卡 不再做选择
        {
            //        var chosenCard = cards[chosenIndex]   // struct的copy特性 make a copy this card in array
            // 所以要直接修改cards数组, 但self是struct本身不可变, 因此要将此函数声明为mutating
            
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[potentialMatchIndex].content == cards[chosenIndex].content {
                    cards[potentialMatchIndex].isMatched = true
                    cards[chosenIndex].isMatched = true
                }
                indexOfTheOneAndOnlyFaceUpCard = nil  // 无论是否匹配 都将标记置位空
            } else {
                // 当标记为空时 应将所有卡背朝上
                for index in cards.indices {
                    cards[index].isFaceUp = false
                }
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
            cards[chosenIndex].isFaceUp.toggle() // 点击的卡片都翻面
        }
        print("\(cards)")
    }
    
//    // 这个函数Array有内置的实现
//    func index(of card: Card) -> Int? {  // 当没有找到card时 返回nil
//        for index in 0..<cards.count {
//            if card.id == cards[index].id {
//                return index
//            }
//        }
//        return nil
//    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        
        var id: Int  // 唯一标识符
    }
}
