//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Kameron Arceneaux on 12/19/23.
//

/*
 This is our ViewModel
 */

import SwiftUI

class EmojiMemoryGame {
    private static let emojis = ["👻", "🎃", "🕷️", "😈", "😈", "💀", "🕸️", "🧙", "🙀", "👹", "😱", "☠️", "🍭"]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame(numberOfPairsOfCards: 4) { pairIndex in
            if emojis.indices.contains(pairIndex){
                return emojis [pairIndex]
            } else {
                return "⁉️"
            }
            
        }
    }
    
    private var model = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    func choose(_ card: MemoryGame<String>.Card){
        model.choose(card)
    }
}
